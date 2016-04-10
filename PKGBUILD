# Maintainer: Maxime Gauduin <alucryd@archlinux.org> 
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dcelasun <dcelasun@gmail.com>

pkgname=plank-bzr
pkgver=r1551
pkgrel=1
pkgdesc='Elegant, simple, clean dock'
arch=('i686' 'x86_64')
url='https://launchpad.net/plank'
license=('GPL3')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala')
provides=('plank')
conflicts=('plank')
install='plank.install'
source=('bzr+lp:plank')
sha256sums=('SKIP')

pkgver() {
  cd plank

  echo "r$(bzr revno)"
}

build() {
  cd plank

  ./autogen.sh \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --disable-apport
  make
}

package() {
  cd plank

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
