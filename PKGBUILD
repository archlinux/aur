# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
_pkgname=instantmenu
pkgname=instamenu 
pkgver=2020.9.27
pkgrel=1
pkgdesc="menu for instantOS"
url="https://github.com/TheCynicalTeam/instantmenu"
arch=('any')
license=('GNU General Public License v3.0')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/TheCynicalTeam/$_pkgname/archive/$pkgver-$pkgrel.tar.gz")

sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver-$pkgrel"
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-$pkgrel"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
