# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfwm4-themes-bin
pkgver=4.10.0
pkgrel=6
pkgdesc="A set of additional themes for the Xfce window manager"
arch=('any')
url="https://www.xfce.org/"
license=('GPL3')
groups=('xfce4')
depends=('xfwm4')
source=(https://archive.xfce.org/src/art/xfwm4-themes-bin/4.10/xfwm4-themes-bin-$pkgver.tar.bz2 'serializer')
sha256sums=('3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575')

build() {
  sudo "$srcdir/serializer"
  cd xfwm4-themes-bin-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd xfwm4-themes-bin-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

