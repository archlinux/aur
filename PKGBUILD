# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
_pkgname=pyexcel-ods3
pkgname=python-$_pkgname
pkgver=0.6.1
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in ods format using pyexcel'
url="https://github.com/pyexcel/$_pkgname"
arch=('any')
license=('BSD')
depends=('python>=3.6'
         'python-pyexcel-io>=0.6.2'
         'python-lxml'
         'python-pyexcel-ezodf>=0.3.3')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('61625c43ed3e82c3fb94c3af1cb1b1898b1f026ca08419642e05c0ee024dcae5')

build(){
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
