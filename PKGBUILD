# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_name=${pkgname#python-}
pkgver=1.11.2
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://github.com/cokelaer/bioservices"
makedepends=(python-build python-installer python-wheel)
depends=('python-easydev>=0.9.36' 'python-beautifulsoup4' 'python-pandas'
         'python-colorlog' 'python-grequests' 'python-requests-cache'
         'python-xmltodict' 'python-suds')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('31baaab4ab813b93f79995ba8cad431a16cbee99e1b0c6f9e419dd4be0c73a9e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
