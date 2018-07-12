# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=evernote-sdk-python
pkgver=1.28
pkgrel=4
pkgdesc='Evernote SDK for Python'
arch=('any')
url="https://github.com/evernote/$pkgname"
license=('Custom')
depends=('python2-oauth2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'evernote-sdk-python-1.28-fix-setup.patch')
sha256sums=('1fc44ba6430b37515c3d72b1091944e31abd106ea5dff522efbd58cf56c662d5'
	    'ffea8b7e98eedf2372e857e8464cdd1177a686f4b9e774e8a71f3f685d0e42ef')

prepare() {
  cd $pkgname-$pkgver
  patch -p0 < ../$pkgname-$pkgver-fix-setup.patch
}

build () {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
