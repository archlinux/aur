# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-bioservices
_pkgname=${pkgname#python-}
pkgver=1.7.9
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://bioservices.readthedocs.io/"
depends=('python-soappy' 'python-easydev' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1711589cdd250e0ea043ee95d111def35aa20febb111aa32914e22728791c670')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
