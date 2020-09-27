# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
_pkgname=instantmenu
pkgname=instamenu 
pkgver=2020.9.27
pkgrel=2
pkgdesc="dmenu like menu with the Manjaro Breath theme"
url="https://github.com/TheCynicalTeam/instantmenu"
arch=('any')
license=('GNU General Public License v3.0')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=($pkgname instantmenu dmenu)
conflicts=(instantmenu dmenu)
replaces=(instantmenu dmenu)
source=("https://github.com/TheCynicalTeam/$_pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('9d1cb96ecfc11fb9e69f7b09e263f026f5d34fa54e4e6b9bd21d7eefcbaee58d')

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
