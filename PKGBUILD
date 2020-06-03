# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-discogs-api
pkgver=0.0.2
pkgrel=1
pkgdesc="Interface to the Discogs REST API"
arch=('any')
url="https://github.com/grawlinson/python-discogs-api"
license=('BSD')
depends=('python-six' 'python-requests' 'python-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('873a2d483dcdfe5dae7acc0a74e7550f42c3e337f135107d12e190059d762fe0584a4b1fa256e51dcae696f6c2f6206ece177f3defe51529d9d231e2405b96f2')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
