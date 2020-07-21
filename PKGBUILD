# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
_pkgname=pyexcel-xls
pkgname=python-$_pkgname
pkgver=0.5.8
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in xls, and read xlsx and xlsm format using pyexcel'
url="https://github.com/pyexcel/$_pkgname"
arch=('any')
license=('BSD')
depends=('python>=3.3'
         'python-pyexcel-io>=0.5.3'
         'python-xlrd'
         'python-xlwt')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('1d0d2094b0f5954889ff30acada8cc4c966b1c8eff4049c0b10c59779fc861eb')

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
