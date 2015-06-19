# Maintainer: Ian Thompson <dalrik370 at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TheBenj88 <thebenj88 *AT* gmail *DOT* com>

pkgname=openxcom
pkgver=1.0
pkgrel=2
pkgdesc="An open-source reimplementation of the famous X-COM game"
arch=('i686' 'x86_64')
url="http://openxcom.org/"
license=('GPL3')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image' 'yaml-cpp>=0.5' 'mesa')
makedepends=('boost' 'glu' 'xmlto' 'docbook-xml' 'docbook-xsl')
install="${pkgname}.install"
source=("https://github.com/SupSuper/OpenXcom/archive/v1.0.tar.gz"
		"${pkgname}.install")
sha256sums=('45acb280010a01d60506b1c5f2951ae501c012cc6161aac470bd15c1e6981246'
            '33a412d870d8c1399738b71f772aaa5954d0028a9c42373ca4a27124c154956d')


build() {
  cd "${srcdir}/OpenXcom-1.0"
  ./autogen.sh
  ./configure --prefix=/usr --without-docs
  make
}

package() {
  cd "${srcdir}/OpenXcom-1.0"
  make DESTDIR="$pkgdir" install
}
