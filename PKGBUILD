# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-ftx"
pkgver=0.1.2
pkgrel=1
pkgdesc="Unofficial Python wrapper for FTX API"
arch=('any')
url="https://github.com/wanth1997/$pkgname"
license=('MIT')
depends=('python-requests' 'python-aiohttp' 'python-websockets' 'python-loguru')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3f48d70136b3337ea020e5e385ec4c4e6eb3330642fcdfd77a4bd0fd987567e9')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

