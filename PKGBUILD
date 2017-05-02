# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>

pkgname=ddcutil
pkgver=0.8.0
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
license=('GPL')
conflicts=('ddcutil-git')
source=(https://github.com/rockowitz/ddcutil/archive/v${pkgver}.tar.gz)
sha256sums=('487c87f0dc686c98d1196205d384aa2c73dc3ccefbe06d46193618812a6bc3cd')
arch=('i686' 'x86_64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh ts=2 sw=2 et
