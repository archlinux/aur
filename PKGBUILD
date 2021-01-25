# Maintainer: Peter Taylot <me@et1.uk>
pkgname=big-finish-downloader
pkgver=v1.0.3
pkgrel=4
origver=1.0.3

pkgdesc="A GTK tool to manage your Big Finish Library"
arch=("x86_64")
url="https://github.com/Emersont1/big-finish-downloader"
license=('MIT')
depends=(gtk3 libsecret curl)
makedepends=(cmake gcc)
source=("https://github.com/Emersont1/big-finish-downloader/releases/download/v$origver/bin.tar.gz")

md5sums=('77648329eb96e399a29d862eaab5ea0d')
sha256sums=('6eed9608d75457b7d2ec93c48743ce82ec9e67c5a205e2851ced3dc7e1fb130c')

prepare() {
    rm $srcdir/lib/libcurl.so
}

package() {
    mkdir $pkgdir/usr; chmod 755 $pkgdir/usr
    cp -r $srcdir/{lib,bin,share} $pkgdir/usr

}
