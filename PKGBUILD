# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-httpretty
pkgver=1.1.4
pkgrel=3
pkgdesc="HTTP client mock for Python"
arch=('any')
url="https://github.com/gabrielfalcao/httpretty"
license=('MIT')
depends=('python38-urllib3')
makedepends=('python38-setuptools')
checkdepends=('python38-nose' 'python38-coverage' 'python38-eventlet' 'python38-freezegun' 'python38-httplib2'
              'python38-redis' 'python38-rednose' 'python38-requests' 'python38-sure' 'python38-tornado'
              'python38-httpx' 'python38-boto3')
source=("https://github.com/gabrielfalcao/HTTPretty/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('58c733ba4719f97e06e2313bb6b94f1c6609d3facb2e0262ac37be97f1c3430eac661611ba9b3712c9c1809846e177b61f3fc2945f3770d475f70b81bea2aced')

check() {
  cd HTTPretty-$pkgver
  nosetests3 -s tests
}

package_python38-httpretty() {
  cd HTTPretty-$pkgver
  python38 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
