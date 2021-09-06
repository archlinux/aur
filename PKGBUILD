# Maintainer: Duama <i@rvf6.com>

pkgname=python-ghostscript
pkgver=0.7
pkgrel=1
pkgdesc="This package implements an interface to the Ghostscript C-API using ctypes."
arch=('any')
url="https://gitlab.com/pdftools/python-ghostscript"
license=('GPL3')
depends=('python' 'ghostscript')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://gitlab.com/pdftools/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('fe311cf79cef213b54c5cdfffcb2cf603decefb63f017070fa2ec8da4f27e96d')

build() {
  cd $pkgname-v$pkgver
  python setup.py build
}

check() {
  cd $pkgname-v$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd $pkgname-v$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

