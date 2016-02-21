# Maintainer: Sven Klomp <mail@klomp.eu>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
_pkgsrcname=python-gnupg
pkgver=0.3.8
pkgrel=1
pkgdesc="This module allows easy access to GnuPG's key management, encryption and signature functionality from Python programs." 
url="https://pypi.python.org/pypi/python-gnupg" 
license=("BSD")
arch=("any")
depends=('python' 'gnupg') 
source=("https://pypi.python.org/packages/source/p/python-gnupg/${pkgname}-${pkgver}.tar.gz")
md5sums=('54d312056cb8903358bdd0a18522f702')

build() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py install --prefix=${pkgdir}/usr --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

