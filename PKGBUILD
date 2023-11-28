# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs-bin
__pkgname=peertube-viewer-rs
pkgver=1.8.5
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://peertube-viewer.com" 
license=('MIT')
provides=("peertube-viewer-rs")
conflicts=("peertube-viewer-rs")

depends=(
  'gcc-libs'
)

source=("https://peertube-viewer.com/releases/linux/$__pkgname-v$pkgver.tar.gz")
md5sums=('7812fa8eab1095aa5b32d052c4d340ab')

package() {
    install -Dm755 peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm755 completions/peertube-viewer-rs.bash $pkgdir/etc/bash_completion.d/peertube-viewer-rs.bash

    install -Dm755 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
