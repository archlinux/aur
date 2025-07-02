# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=freetakserver-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Situational Awareness Server compatible with TAK clients (ATAK, WinTAK, ITAK)"
arch=('any')
url="https://github.com/FreeTAKTeam/FreeTakServer"
license=('EPL')
depends=(
  'python'
  'python-flask'
  'python-lxml'
  'python-tabulate'
  'python-sqlalchemy'
  'python-flask-sqlalchemy'
)
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/FreeTAKTeam/FreeTakServer.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
