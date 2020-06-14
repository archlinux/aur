# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-discogs-api
pkgver=0.1.0
pkgrel=1
pkgdesc="Interface to the Discogs REST API"
arch=('any')
url="https://github.com/grawlinson/python-discogs-api"
license=('BSD')
depends=('python-six' 'python-requests' 'python-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('82213b3cf29a5d2770a5c3fbd9426fda22af09c1b0ba52970478f0384a8c13e845446ac84c2527738677dd1082756198f7f0b4ed217c58d272b550d750f8dee2')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
