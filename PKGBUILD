# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Tomas Acauan Schertel <tschertel@gmail.com>

pkgname=pspshrink
pkgver=1.1.2
pkgrel=5
pkgdesc="PSP Shrink allows you to shrink your isos to the cso format."
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/pspshrink/"
license=('GPL2')
makedepends=('gtkmm')
optdepends=('gtkmm: for pspshrinkui')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c9f7dc58c983016047ceebbacb9856e9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
