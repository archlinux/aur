# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libss7
pkgver=2.0.0
pkgrel=1
pkgdesc='userspace library for providing SS7 protocol services to applications'
arch=('i686' 'x86_64')
url='http://www.asterisk.org/'
license=('GPL')
depends=('dahdi')
source=("https://downloads.asterisk.org/pub/telephony/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5af00853cfb2bc6bcf050947804db132ae6872db0cd2ab24b5378828f78eda52')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install 
}
