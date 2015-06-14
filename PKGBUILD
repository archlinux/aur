# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Jeremy Newton (Mystro256)

pkgname=mist-icon-theme
pkgver=2.32.1
pkgrel=4
pkgdesc="Mist icon theme"
arch=('any')
url="https://wiki.gnome.org/GnomeArt"
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('intltool' 'gtk-engines' 'icon-naming-utils')
install="mist-icon-theme.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/gnome-themes/2.32/gnome-themes-$pkgver.tar.bz2")
sha256sums=('8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a')

build() {
  cd "gnome-themes-$pkgver"

  ./configure --prefix=/usr --disable-dependency-tracking
  make -C icon-themes/Mist
}

package() {
  cd "gnome-themes-$pkgver"

  make DESTDIR="$pkgdir" -C icon-themes/Mist install
}

# vim:set ts=2 sw=2 et:
