# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs-bin
__pkgname=peertube-viewer-rs
pkgver=1.8.5
pkgrel=2
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
sha256sums=('a91eef3aa511ee638773fdb423a35ea42a4cd58b646cf11d15a46ad785996c0f')

package() {
    install -Dm755 peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm644 completions/peertube-viewer-rs.bash $pkgdir/usr/share/bash-completion/completions/peertube-viewer-rs.bash

    install -Dm644 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
