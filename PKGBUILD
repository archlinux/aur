# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=cargo-sync-rdme
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Cargo subcommand to synchronize README with crate documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/cargo-sync-rdme"
license=('MIT' 'Apache')
depends=('gcc-libs' 'zlib')
source_x86_64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/gifnksm/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dac31371511f94f4662f325818dfd48d472ec07acdd5906c02dd0fe7b8ffffb8')
sha256sums_aarch64=('ebca37b7d2af0187d69e13305f39d3ad5d8eacbcc35258e59966d67520287e7b')

package() {
	cd "$srcdir/"

        install -Dm 755 cargo-sync-rdme -t "${pkgdir}/usr/bin/"

        install -Dm 644 man/cargo-sync-rdme.1 -t "${pkgdir}/usr/share/man/man1/"

        install -Dm 644 completion/_cargo-sync-rdme -t "${pkgdir}/usr/share/zsh/site-functions/"
        install -Dm 644 completion/cargo-sync-rdme.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
        install -Dm 644 completion/cargo-sync-rdme.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

        install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${_pkgname}"
        install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"

}
