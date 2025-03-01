# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_name=${pkgname#python-}
pkgver=1.12.1
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
sha256sums=('0f31782ae50930d4ab82b43f98d1ca2cc9befaa699f3a7a6cba512a8f9e2cab0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
