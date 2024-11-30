# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
_pkgname=cargo-sync-rdme
pkgname=${_pkgname}-bin
pkgver=0.4.0
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
sha256sums_x86_64=('596ccf176d31cc394daec043ec6513fe1e768f73556ebf89d90f77ba39b9c3c1')
sha256sums_aarch64=('10dcfbae92d7b52ae3f2ebe08b750228a3a3987adeb7a4e63d4cc1493a5ef072')

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
