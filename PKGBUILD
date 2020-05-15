# Maintainer: 
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala0.26
pkgver=0.26.2
pkgrel=1
pkgdesc="Compiler for the GObject type system. Legacy version for building Valama against."
url="https://wiki.gnome.org/Projects/Vala"
arch=(i686 x86_64)
license=(LGPL)
depends=(glib2)
#provides=(vala)
conflicts=(vala)
makedepends=(libxslt vala)
source=("https://download.gnome.org/sources/vala/0.26/vala-${pkgver}.tar.xz")
sha256sums=('37f13f430c56a93b6dac85239084681fd8f31c407d386809c43bc2f2836e03c4')

build() {
  cd "vala-${pkgver}"
  ./configure --prefix=/usr --enable-vapigen
  make
}

package() {
  cd "vala-${pkgver}"
  make DESTDIR="$pkgdir" install
}
