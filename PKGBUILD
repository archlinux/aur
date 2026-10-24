# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=cargo-sync-rdme
pkgname=${_pkgname}-bin
pkgver=0.8.5
pkgrel=1
epoch=
pkgdesc="Cargo subcommand to synchronize README with crate documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/cargo-sync-rdme"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'zlib')
conflicts=('cargo-sync-rdme')
provides=('cargo-sync-rdme')
source_x86_64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ba5e5bcd3b6c203efb8d57b5b2c4d40fe3dc5099c4ede991ead759aab1826201')
sha256sums_aarch64=('62ac1ea9138fc257e7922d468d9cf00ba7d8379c7e5ef01fc05cfb20fa673bad')

package() {
        cd "$srcdir/"

        install -Dm 755 cargo-sync-rdme -t "${pkgdir}/usr/bin/"

        install -Dm 644 man/cargo-sync-rdme.1 -t "${pkgdir}/usr/share/man/man1/"

        install -Dm 644 completion/_cargo-sync-rdme -t "${pkgdir}/usr/share/zsh/site-functions/"
        install -Dm 644 completion/cargo-sync-rdme.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
        install -Dm 644 completion/cargo-sync-rdme.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

        install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
        install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

}
