# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-ftx"
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Python wrapper for FTX API"
arch=('any')
url="https://github.com/wanth1997/$pkgname"
license=('MIT')
depends=('python-requests' 'python-aiohttp' 'python-websockets' 'python-loguru')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f482d062c4c7a749dfdd593648f4d82f61f5b3f67f19c0c42bacaf3f0a8b934d')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

