# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname='nemo-image-converter'
pkgver=3.2.0
_mintrel='betsy'
pkgrel=1
pkgdesc="Resize and rotate images directly in Nemo"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo' 'imagemagick')
makedepends=('gnome-common')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('3bdda1a6275341828e1c0d52cc51d5edf0f8e8aaba5998f813201fec51f9d1cf')

build() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  make DESTDIR="${pkgdir}" install
}
