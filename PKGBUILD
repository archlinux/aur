# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=souko
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache')
depends=('gcc-libs' 'zlib')
conflicts=('souko')
provides=('souko')
source_x86_64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5950432e9b3dcf8fe3d46c303c0383a98e0845cbd81d5033e05d242f56532366')
sha256sums_aarch64=('bcc7acfdbe54e4d0cb7b72dfc4559de8cd1b32d2e3f041a82dd45b137a58bd62')

package() {
        cd "$srcdir/"

        install -Dm 755 souko -t "${pkgdir}/usr/bin/"

        install -Dm 644 man/*.1 -t "${pkgdir}/usr/share/man/man1/"

        install -Dm 644 completion/_souko -t "${pkgdir}/usr/share/zsh/site-functions/"
        install -Dm 644 completion/souko.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
        install -Dm 644 completion/souko.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

        install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
        install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

}
