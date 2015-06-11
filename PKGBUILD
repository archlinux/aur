# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=gimp-plugin-image-reg
_srcname=gimp-image-reg
pkgver=0.5.5
pkgrel=1
pkgdesc="Image registration plugin for the GIMP"
arch=('i686' 'x86_64')
url="http://registry.gimp.org/node/24248"
license=('GPL3')
depends=('gimp')
makedepends=('intltool' 'gettext')
source=(http://downloads.sourceforge.net/${_srcname}/${_srcname}-${pkgver}.tar.gz)
md5sums=('405b87140880de18d695173ee6b08981')

build() {
  cd "$srcdir/${_srcname}-${pkgver}"
  LIBS='-lm' ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_srcname}-${pkgver}"
  make DESTDIR="$pkgdir/" PLUGINDIR=/usr/lib/gimp/2.0 install
}

