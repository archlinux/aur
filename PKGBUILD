# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=2.1.r1.g37fe69f
pkgrel=1

pkgdesc="A simple shell script to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha.git"
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
