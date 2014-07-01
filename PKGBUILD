# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.21.0
pkgrel=2
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.22.0')
makedepends=('pkg-config' 'intltool')
url="http://live.gnome.org/GnomeArt"
source=(ftp://ftp.archlinux.org/other/gtk-engines/${pkgname}-${pkgver}.tar.gz
        ftp://ftp.archlinux.org/other/gtk-engines/${pkgname}-${pkgver}.tar.gz.sig)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
md5sums=('d82ae66d6eb045d83c30b78b13818d41'
         'c1166505961b9aa2ef98228a7cea1860')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-animation
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
