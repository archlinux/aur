# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias [tobias at archlinux.org]

pkgname=mousepad-gtk3
_pkgname=mousepad
pkgver=0.4.0
pkgrel=5
pkgdesc="Simple text editor for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4-goodies')
depends=('gtksourceview3' 'dbus-glib' 'dconf' 'desktop-file-utils')
makedepends=('intltool' 'perl')
optdepends=("gtksourceview3-pkgbuild: PKGBUILD syntax highlight support in gtksourceview3")
conflicts=('mousepad')
source=(http://archive.xfce.org/src/apps/${_pkgname}/${pkgver%.*}/${_pkgname}-$pkgver.tar.bz2)
md5sums=('f55314c5dda6323883241e6cf01550a7')


build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --enable-gtk3
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
