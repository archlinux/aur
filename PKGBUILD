# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=cargo-sync-rdme
pkgname=${_pkgname}-bin
pkgver=0.5.2
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
sha256sums_x86_64=('c3e0e8daa3d0e3d34395dbcf582f54b4fcd0d5d2251c1b9deb33715ca6990dab')
sha256sums_aarch64=('85ac57c5a930003a5b8491bb0af26f04faa9e303b4e0e61cac3f3bf97e22a1bf')

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
