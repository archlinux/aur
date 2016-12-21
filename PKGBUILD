# Maintainer: Rihards Skuja <rskuja@gmail.com>
_pkgname=when-changed
pkgname=$_pkgname-git
pkgver=0.r62.7a2df66
pkgrel=1
pkgdesc="Execute a command when a file is changed."
arch=('any')
url="https://github.com/joh/when-changed"
license=('BSD')
depends=('python2' 'watchdog')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/joh/when-changed.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}
