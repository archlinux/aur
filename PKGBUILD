# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_pkgname=${pkgname#python-}
pkgver=1.10.3
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://github.com/cokelaer/bioservices"
depends=('python-easydev>=0.9.36' 'python-beautifulsoup4' 'python-pandas'
         'python-colorlog' 'python-grequests' 'python-requests-cache'
         'python-xmltodict' 'python-suds')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('7a6ed5a0a834fc92f91b809e66eb186a5a410b38b5fa1dd741d52c654e6f8fa6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
