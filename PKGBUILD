# Maintainer: Peter Taylot <me@et1.uk>
pkgname=big-finish-downloader
pkgver=v1.1.0
pkgrel=1
origver=1.1.0

pkgdesc="A GTK tool to manage your Big Finish Library"
arch=("x86_64")
url="https://github.com/Emersont1/big-finish-downloader"
license=('MIT')
depends=(gtk3 libsecret curl)
makedepends=(cmake gcc)
source=("https://github.com/Emersont1/big-finish-downloader/releases/download/v$origver/bin.tar.gz")

md5sums=('0b19a66fcfe7123bf8bb4cac208f32fa')
sha256sums=('4f4874613a66300c36989913210f7ead6cf31c50b1927f50fd0977d1d9e2d8fd')

prepare() {
    rm $srcdir/lib/libcurl.so
}

package() {
    mkdir $pkgdir/usr; chmod 755 $pkgdir/usr
    cp -r $srcdir/{lib,bin,share} $pkgdir/usr

}
