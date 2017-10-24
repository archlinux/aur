# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-ods
pkgver=0.5.2
pkgrel=1
pkgdesc="A wrapper library to read, manipulate and write data in ods format"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-ods"
license=('BSD-3-clause')
makedepends=('python-setuptools')
depends=('python' 'python-odfpy' 'python-pyexcel-io')
source=("https://github.com/pyexcel/pyexcel-ods/archive/v$pkgver.tar.gz")
md5sums=('455651df3a61a955d2be77a9829644d8')

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
