# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_relationship
_name=trytond_party_relationship
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Party Relationship module for Tryton"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f202e696553b2f0918ca07ffb599179d1aa5a74981c38ad87c54e3194a483a87')
sha512sums=('8400e8746a3a816f982b1a990ba9954d430249faf78e16d1c73e964469c35cd1e21da3951bee206d955f29aa785ab9085609522865a34e0fc187961d0abf026a')
b2sums=('acbe809955b54e012239f6459b7cf058bd19536bd0f5fb4dd6d8870311edb1ffc63ce79e4905c157bedbca17c5343bf8a24db270db4fa290f99525b976b573ee')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
