# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=souko
pkgname=${_pkgname}-bin
pkgver=0.4.2
pkgrel=1
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'zlib')
conflicts=('souko')
provides=('souko')
source_x86_64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7791c74a1e109475e1ededca17a2207dae79634369e61680be575e318b778cdf')
sha256sums_aarch64=('ecafab246e4f94d3c406ec5f3580cdeab640283589bafa6d8e28f00255279357')

package() {
        cd "$srcdir/"

        install -Dm 755 souko -t "${pkgdir}/usr/bin/"

        install -Dm 644 man/*.1 -t "${pkgdir}/usr/share/man/man1/"

        install -Dm 644 completion/_souko -t "${pkgdir}/usr/share/zsh/site-functions/"
        install -Dm 644 completion/souko.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
        install -Dm 644 completion/souko.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
        install -Dm 644 completion/souko.nu -T "${pkgdir}/usr/share/nushell/vendor/autoload/souko-completions.nu"

        install -Dm 644 souko.plugin.zsh -t "${pkgdir}/usr/share/zsh/plugins/souko/"
        install -Dm 644 shell/key-bindings.zsh -t "${pkgdir}/usr/share/zsh/plugins/souko/shell/"

        install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
        install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

}
