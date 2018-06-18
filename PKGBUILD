# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfdesktop
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.4
pkgrel=1
pkgdesc="A desktop manager for Xfce (GTK2 version)"
arch=('x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4ui' 'thunar-gtk2' 'garcon' 'hicolor-icon-theme' 'libwnck')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/xfdesktop/${pkgver%.*}/xfdesktop-$pkgver.tar.bz2)
sha256sums=('098a35510562907e1431d5adbfa8307484a235c1dec6a43e2d58d2ac4241f1cb')

build() {
  cd "$srcdir/xfdesktop-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-thunarx \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "$srcdir/xfdesktop-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
