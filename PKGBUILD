# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgbase=python-iexfinance
pkgname=(python-iexfinance python2-iexfinance)
pkgver=0.3.1
pkgrel=1
pkgdesc="Python wrapper for the Investor's Exchange (IEX) Developer API"
url='https://addisonlynch.github.io/iexfinance/'
arch=(any)
license=(apache)
depends=(python python-pandas python-requests)
makedepends=(python-setuptools python2-setuptools)
source=("${pkgbase}::git+https://github.com/addisonlynch/iexfinance.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  cp -a ${pkgbase} ${pkgbase}2
}

package_python-iexfinance() {
  cd ${pkgbase}
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-iexfinance() {
  depends=(python2 python2-pandas python2-requests)

  cd ${pkgbase}2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
