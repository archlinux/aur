# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.7.0
pkgrel=1
pkgdesc="Compilation of plugins for the libpurple family of IM clients"
arch=('i686' 'x86_64')
url="https://www.guifications.org/projects/purple-plugin-pack"
license=('GPL')
depends=('libpurple')
makedepends=('intltool' 'gettext' 'python2' 'pidgin')
options=('!libtool')
source=(https://www.guifications.org/attachments/download/201/purple-plugin-pack-2.7.0.tar.bz2)
sha256sums=('2bbcf5e778a33968ba7f2864d2a6cb526a8984be3e4151642a583eee8eafb03c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PYTHON=/usr/bin/python2 \
    ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
