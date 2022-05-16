# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=percol
pkgver=0.2.1
pkgrel=3
pkgdesc="Adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
arch=('any')
depends=('python2-six')
makedepends=('python2-setuptools')
optdepends=('python2-cmigemo: for migemo support')
url="https://github.com/mooz/percol"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mooz/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('75056ba1fe190ae4c728e68df963c0e7d19bfe5a85649e51ae4193d4011042f9')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
