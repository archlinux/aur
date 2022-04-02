# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-local-depth-cache"
_pkgname=${pkgname#python-}
pkgver=0.7.2
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-unicorn-binance-rest-api' 'python-unicorn-binance-websocket-api')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('710a57901bbba453cc76c08e2de11f3cd0f6c46882400434f9f29d2911f3778c')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
