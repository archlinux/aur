# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=tetherback-git
pkgver=0.130.336ae83
pkgrel=1
pkgdesc="Create backups of an Android device over USB (requires adb and TWRP recovery)"
arch=('any')
url="https://github.com/dlenski/tetherback"
license=('GPL3')
makedepends=('git')
depends=('python3' 'python-progressbar2' 'python-tabulate')
conflicts=('tetherback')
provides=('tetherback')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "$srcdir/$pkgname"
  /usr/bin/python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
