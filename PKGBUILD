# Maintainer: willemw <willemw12@gmail.com>

pkgname=cplay-ng-git
pkgver=2.1.0.r185.g92ac5ae
pkgrel=1
pkgdesc="Ncurses front-end for various audio players"
arch=('any')
url="https://github.com/xi/cplay-ng"
license=('GPL2')
depends=('libpulse' 'mpv')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}

