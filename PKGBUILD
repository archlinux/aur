# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=cargo-sync-rdme
pkgname=${_pkgname}-bin
pkgver=0.3.6
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
sha256sums_x86_64=('d7285bf6008b7ce163c103f457bae010ccf04e3b3b6688af69d167b6a4bc2d48')
sha256sums_aarch64=('3f4de4973bc6b477df9fff2b8608fc7cb3c0efbe426f54e6a5fd13bd02b5d1f9')

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
