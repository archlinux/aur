# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_pkgname=${pkgname#python-}
pkgver=1.10.1
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://github.com/cokelaer/bioservices"
depends=('python-easydev>=0.9.36' 'python-beautifulsoup4' 'python-pandas'
         'python-colorlog' 'python-grequests' 'python-requests-cache'
         'python-xmltodict' 'python-suds')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3e90184bc4d597010c73acfaaccbce0e0ddcc80b8aaebe303014d97395e98ef0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
