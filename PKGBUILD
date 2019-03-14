# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfwm4-themes
pkgver=4.10.0
pkgrel=3
pkgdesc="A set of additional themes for the Xfce window manager"
arch=('any')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('xfwm4')
source=(https://archive.xfce.org/src/art/$pkgname/4.10/$pkgname-$pkgver.tar.bz2)
sha256sums=('3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
