# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex
pkgver=12.0.0
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64' 'aarch64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'portmidi' 'wxwidgets-gtk3' 'wxwidgets-qt5' 'miniupnpc' 'jsoncpp' 'libpng')
makedepends=('cmake' 'deutex')
optdepends=('timidity++: Required for music')
source=("http://downloads.sourceforge.net/odamex/Odamex/${pkgver}/odamex-src-${pkgver}.tar.gz")
sha512sums=('20fd8f4c695f858906a9cf57ceef70a228fe0bbd08106db07c90d9a2e3e7fe199d4d2657d91bae05e14e41c98ea3375bd67b80b5bb6e73c335b592ca6351ea08')

prepare() {
  cd $pkgname-src-$pkgver
}

build() {
  cd $pkgname-src-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release   \
        -DCMAKE_INSTALL_PREFIX=/usr  \
        -DUSE_INTERNAL_JSONCPP=0     \
        .
  make
}

package() {
  cd $pkgname-src-${pkgver}
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
