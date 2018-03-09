# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=execstack
pkgver=20130503
pkgrel=7
pkgdesc="set the executable stack flag of ELF binaries and libraries"
depends=(libelf elfutils)
arch=("x86_64")
url="https://people.redhat.com/jakub/prelink"
license=("GPL")
conflicts=(prelink)
source=("https://people.redhat.com/jakub/prelink/prelink-$pkgver.tar.bz2")
sha256sums=("6339c7605e9b6f414d1be32530c9c8011f38820d36431c8a62e8674ca37140f0")

build() {
    cd "prelink"
    ./configure
    cd "src"
    make execstack
}

package() {
    cd "prelink/src"
    mkdir -p "$pkgdir/usr/bin"
    cp execstack "$pkgdir/usr/bin"
}
