# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.24.2
pkgrel=3
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python2-gobject' 'libepc' 'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql')
makedepends=('intltool' 'gnome-doc-utils' 'python-sphinx' 'boost')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/1.24/$pkgname-$pkgver.tar.xz)
sha256sums=('7bd16c9ac0db15d273667c1a39c1f5056669281d69e9c779548b1f6bdaef798b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static \
    PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
