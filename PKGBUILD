# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
pkgname=dps8m-git
_pkgname=dps8m
pkgver=alpha2.0.RC5.r470.g8b4d0018
pkgrel=1
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
makedepends=('clang')
depends=('libuv')
conflicts=('dps8m')
source=("git+https://github.com/charlesUnixPro/dps8m.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -d 755 "$pkgdir/usr/bin"
	make INSTALL_ROOT="$pkgdir/usr" install
}
