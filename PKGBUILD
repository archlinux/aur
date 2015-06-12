# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-bioservices
_pkgname=${pkgname#python2-}
pkgver=1.3.6
pkgrel=1
pkgdesc="Access to many Bioinformatices Web Services and framework implement WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://pypi.python.org/pypi/$_pkgname"
depends=('python2-soappy' 'python2-easydev' 'python2-beautifulsoup4')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('4eebe3584637f47b6370ed5e65497109')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
