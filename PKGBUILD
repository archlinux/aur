# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs-bin
__pkgname=peertube-viewer-rs
pkgver=1.8.8
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://peertube-viewer.sgued.fr" 
license=('AGPL-3.0-or-later')
provides=("peertube-viewer-rs")
conflicts=("peertube-viewer-rs")

depends=(
  'gcc-libs'
)

source=("https://peertube-viewer.sgued.fr/releases/linux/$__pkgname-v$pkgver.tar.gz")
sha256sums=('7319a5c1f55f857e714c07a85a9a78f00c1e1f27bb3187ee04e8226787d13def')

package() {
    install -Dm755 peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm644 completions/peertube-viewer-rs.bash $pkgdir/usr/share/bash-completion/completions/peertube-viewer-rs

    install -Dm644 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
