# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu 
pkgver=2020.9.28
pkgrel=1
pkgdesc="dmenu like menu with the Manjaro Breath theme"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=($pkgname instantmenu dmenu)
conflicts=(instantmenu dmenu)
replaces=(instantmenu dmenu)
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('0a135b635883c58abde95a8aa6a4298cdb9392c445ac33f528109a0f05e75057')

build() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
