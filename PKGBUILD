# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu 
pkgver=2020.12.9
pkgrel=3
pkgdesc="dmenu like menu with the Manjaro Matcha-dark-sea theme"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=($pkgname dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('f5d391ee91eec7925caee9f2638aef9eecfc99f3e31f191d37ad346d9cd907b4')

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
