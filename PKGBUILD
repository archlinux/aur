# Maintainer: LinuxSquare <linuxscripting.sh@gmail.com>
# Contributor: Efe Cetin <efectn@6tel.net>

pkgname=teaiso
pkgver=2.2.0
pkgrel=1
pkgdesc="The ISO generation tool for GNU/Linux."
arch=("any")
url="https://gitlab.com/tearch-linux/applications-and-tools/teaiso"
license=("GPL3")
depends=("xorriso" "mtools" "squashfs-tools" "python-yaml" "busybox" "unzip" "binutils" "grub")
makedepends=("git" "make" "gcc" "wget")
source=("https://gitlab.com/tearch-linux/applications-and-tools/teaiso/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
provides=("mkteaiso")
sha256sums=("999618745afed1167aff345e8a59c07eb93efe1db1fad8df78f5d9f1cce0865e")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
