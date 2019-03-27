# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=libunity
pkgver=7.1.4
pkgrel=8
pkgdesc='Library for instrumenting and integrating with all aspects of the Unity shell'
arch=('i686' 'x86_64')
url='https://launchpad.net/libunity'
license=('LGPL')
depends=('dee' 'gtk3' 'libdbusmenu-glib')
makedepends=('gnome-common' 'gobject-introspection' 'intltool' 'vala')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}+19.04.20190319.orig.tar.gz")
sha256sums=('56ecb380d74bf74caba193d9e8ad6b0c85ccf9eeb461bc9731c2b8636e1f1492')

prepare() {
  cd "${srcdir}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install
}
