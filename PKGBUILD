# Contributor: Cesar Alcalde <lambda512_at_gmail.com>
# Maintainer: ValHue <vhuelamo_at_gmail_dot_com>

pkgname=gimp-plugin-saveforweb
pkgver=0.29.3
pkgrel=2
pkgdesc="Plugin to save optimized images for display on web pages"
url="http://registry.gimp.org/node/33"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gimp>=2.3')
makedepends=('perl-xml-parser' 'intltool' 'gettext')
source=(http://registry.gimp.org/files/gimp-save-for-web-$pkgver.tar.bz2)
md5sums=('9dae11ffa9f7b8e44a65df5b0e49a04c')

build() {
  cd "${srcdir}/gimp-save-for-web-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gimp-save-for-web-$pkgver"
  make DESTDIR=${pkgdir} install
}
