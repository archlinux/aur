# Maintainer: Christopher Michael Mescher $(echo \<julian-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=julian-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=1.1.r0.g9c85f0a
pkgrel=1

pkgdesc="A simple POSIX compliant shell script to convert dates between calendars"
arch=('any')
url="https://gitlab.com/cmmescher/julian.git"
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
