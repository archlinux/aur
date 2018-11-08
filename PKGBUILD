# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=infocus
pkgver=v0.5.r6.g7da2d79
pkgrel=1
pkgdesc="Automatic activity time tracker application."
arch=('any')
url="http://github.com/jgmdev/infocus"
license=('GPL')
depends=('php' 'php-sqlite' 'wmctrl' 'xorg-xprop' 'chromium' 'xprintidle')
makedepends=('composer')
install="${pkgname}.install"
source=('git://github.com/jgmdev/infocus.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  composer install
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ./install.sh
}
