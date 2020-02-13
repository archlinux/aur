# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyexcel-xlsx
pkgname=python-$_pkgname
pkgver=0.5.8
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in xlsx and xlsm format using openpyxl'
url="https://github.com/pyexcel/$_pkgname"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2870c701e7a0f100af8963e9b37b90520bf2fddd8d7964f01b362bd422056846')

build(){
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
