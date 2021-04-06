# Maintainer: TheCynicalTeam <TheCynicalTeam@gitlab.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@gitlab.com>

pkgname=xwingridselect
pkgver=2021.04.06
pkgrel=1
pkgdesc="X11 window switcher with fancy look"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
license=('CC BY-NC-SA 4.0')
depends=('gtk2' 'gtk-engines' 'gtk-engine-murrine')
makedepends=('cmake' 'make')
options=(!libtool strip)

source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_SCRIPTS=ON "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
