# Maintainer: Sven Klomp <mail@klomp.eu>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
_pkgsrcname=python-gnupg
pkgver=0.3.9
pkgrel=1
pkgdesc="This module allows easy access to GnuPG's key management, encryption and signature functionality from Python programs." 
url="https://pypi.python.org/pypi/python-gnupg" 
license=("BSD")
arch=("any")
depends=('python' 'gnupg') 
#source=("https://pypi.python.org/packages/source/p/python-gnupg/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/ec/bc/6e27b54c2fd74f40c0b040693a5d7be20ab4e6e996dc2344cd918e360c16/python-gnupg-0.3.9.tar.gz")
md5sums=('426369c30d5693357b12319e454ccde6')

prepare() {
	cd $srcdir/${pkgname}-${pkgver}/

}

build() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py install --prefix=${pkgdir}/usr --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

