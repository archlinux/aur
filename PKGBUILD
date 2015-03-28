# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.28.4
pkgrel=1
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python2-gobject' 'libepc' 'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql')
makedepends=('intltool' 'gnome-doc-utils' 'python-sphinx' 'boost' 'itstool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/1.28/$pkgname-$pkgver.tar.xz)
sha256sums=('1dea38ddcef3260b584958b60250a23b924431e57bb1c6e07c02a478869cc159')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static \
    PYTHON=python2
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
