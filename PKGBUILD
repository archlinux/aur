# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_name=${pkgname#python-}
pkgver=1.15.0
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL-3.0-only')
url="https://github.com/cokelaer/bioservices"
makedepends=(python-build python-installer python-wheel)
depends=(
    'python-click'
    'python-appdirs'
    'python-matplotlib'
    'python-easydev'
    'python-tqdm>=4.67.1'
    'python-rich-click>=1.8.5'
    'python-coloredlogs>=6.9.0'
    'python-beautifulsoup4>=4.12.3'
    'python-grequests'
    'python-lxml'
    'python-requests-cache'
    'python-suds'
    'python-wrapt'
    'python-xmltodict'
    'python-pandas'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('e38e888f6dcd9a158717f683143a297d070261cd19af6210627e53c3dbc7804b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
