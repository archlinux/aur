# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-io
pkgver=0.5.3
pkgrel=1
pkgdesc="A python library to read and write structured data in csv, zipped csv format and to/from databases"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD-3-clause')
makedepends=('python-setuptools')
depends=('python' 'python-lml')
source=("https://github.com/pyexcel/pyexcel-io/archive/v$pkgver.tar.gz")
md5sums=('596990d778ea3fa9a66d46214e32050e')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
