# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_pkgname=${pkgname#python-}
pkgver=1.8.3
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://github.com/cokelaer/bioservices"
depends=('python-easydev>=0.9.36' 'python-beautifulsoup4' 'python-pandas'
         'python-colorlog' 'python-grequests' 'python-requests-cache'
         'python-xmltodict' 'python-suds')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f901dfba137a98b1192f6352817eaaa36a0442e2d63cda591ef0078db1a00ef8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
