# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
_pkgname=pyexcel-xls
pkgname=python-$_pkgname
pkgver=0.7.1
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in xls, and read xlsx and xlsm format using pyexcel'
url="https://github.com/pyexcel/$_pkgname"
arch=('any')
license=('BSD')
depends=('python>=3.6'
         'python-pyexcel-io>=0.6.2'
         'python-xlrd'
         'python-xlwt')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('0b7a5a0347976f60fe8c36df6b75216c64093ac0a15cdfdd530afcc6b63a132c')

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
