# Maintainer: Ner0

pkgname=gtk-theme-config
pkgver=0.1
pkgrel=1
pkgdesc="A tool to configure GTK theme colors."
arch=('i686' 'x86_64')
url="https://github.com/satya164/gtk-theme-config"
license=('GPL3')
depends=('cairo' 'glib2' 'gtk3')
makedepends=('vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/satya164/gtk-theme-config/tarball/v$pkgver")
md5sums=('de13f0d89d69333e791366a2c5ca9f38')

package() {
  cd satya164-*

  sed -i '/CFLAGS=/s/$/\ --Xcc=-lm/' Makefile

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
