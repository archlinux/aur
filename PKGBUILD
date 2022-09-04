# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=python-pygubu
_pkgname=pygubu
pkgver=0.24.2
pkgrel=0
pkgdesc="python pygubu core library"
url="https://github.com/alejandroautalan/pygubu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'tk' 'python-appdirs')
source=("{$pkgname}-${pkgver}.tar.gz::https://github.com/alejandroautalan/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2f9e6c244431e9240fa31b939766e2d2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
