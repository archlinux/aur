# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>

pkgname=ddcutil
pkgver=0.8.4
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB.'
url='http://ddcutil.com/'
license=('GPL')
conflicts=('ddcutil-git')
source=(https://github.com/rockowitz/ddcutil/archive/v${pkgver}.tar.gz)
sha256sums=('7bfa9bd1dad7aac1853cf1070d2becf47156c158b84ae874cd77e8fd7d4e44d5')
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
