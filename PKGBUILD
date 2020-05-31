# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-config
pkgver=0.0.15
pkgrel=1
pkgdesc='Tux Paint configuration tool'
arch=('x86_64')
url='http://www.tuxpaint.org/' # no https available
license=('GPL')
depends=('tuxpaint' 'fltk' 'libxft' 'libxext')
options=('!makeflags')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('2b4c81d1f9664334907b70684d0f2cd340d2fc74fded453d107f39461c167240')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" KDE_PREFIX="" \
    KDE_ICON_PREFIX="" X11_ICON_PREFIX=/usr/share/pixmaps/ install
  install -Dm644 src/tuxpaint-config.desktop \
    "$pkgdir/usr/share/applications/tuxpaint-config.desktop"
}

# vim: ts=2 sw=2 et:
