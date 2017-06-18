# Maintainer: willemw <willemw12@gmail.com>

#pkgname=('python-twodict' 'python2-twodict')
_pkgname=python2-twodict
pkgname=$_pkgname-git
pkgver=1.2.r0.g4c6e0e3
pkgrel=1
pkgdesc="Simple two way ordered dictionary for Python"
arch=('any')
url="https://github.com/MrS0m30n3/twodict"
license=('custom:UNLICENSE')
depends=('python2')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/MrS0m30n3/twodict.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd $pkgname
  python2 test_twodict.py
}

package() {
  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

