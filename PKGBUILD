# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-pywapi-git
pkgver=r126.7f05282
pkgrel=1
pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
arch=('any')
url="https://launchpad.net/python-weather-api"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#source=($pkgname::git+https://github.com/khurshid-alam/python-weather-api.git)
source=($pkgname::git+https://git.launchpad.net/~khurshid-alam/python-weather-api/+git/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir" --optimize=1
}

