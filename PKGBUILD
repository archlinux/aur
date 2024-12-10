# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex
pkgver=10.6.0
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64' 'aarch64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl2_mixer' 'portmidi' 'wxwidgets-gtk3' 'miniupnpc')
makedepends=('cmake' 'deutex')
optdepends=('timidity++: Required for music')
source=("http://downloads.sourceforge.net/odamex/Odamex/${pkgver}/odamex-src-${pkgver}.tar.gz")
sha256sums=('56f05c11aef72eafbf5d1e76ea05f57e98495148f930ad8afca01f6f26ada13b')

prepare() {
  cd $pkgname-src-$pkgver
}

build() {
  cd $pkgname-src-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release                              \
        -DCMAKE_INSTALL_PREFIX=/usr                             \
        .
  make
}

package() {
  cd $pkgname-src-${pkgver}
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
