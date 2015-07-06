# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=realboy
pkgver=0.2.2
pkgrel=1
pkgdesc="Complete, Fast, Accurate, Free, Game Boy/Game Boy Color/Super Game Boy Emulator for Linux/Unix."
arch=('i686' 'x86_64')
url='http://realboyemulator.wordpress.com/'
license=('GPL')
depends=('sdl')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('c305c1f8d4dd6d8db7707964acf241f9')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  for i in AUTHORS COPYING ChangeLog INSTALL NEWS README TODO; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"
  done
}

# vim:set ts=2 sw=2 et:
