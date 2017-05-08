# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname='nemo-image-converter'
pkgver=3.4.0
_mintrel='betsy'
pkgrel=1
pkgdesc="Resize and rotate images directly in Nemo"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo' 'imagemagick')
makedepends=('gnome-common')
options=('!emptydirs')
#source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2')

build() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
