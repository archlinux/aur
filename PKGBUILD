# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributer: Gan Lu <rhythm.gan@gmail.com>

pkgname=scim-pinyin
pkgver=0.5.92
pkgrel=4
pkgdesc='Chinese pinyin input for SCIM'
url='https://www.scim-im.org/'
arch=('x86_64')
license=('GPL')
depends=('scim')
source=("https://downloads.sourceforge.net/sourceforge/scim/${pkgname}-${pkgver}.tar.xz")
sha256sums=('30cb1d24db913bfe239429f3421b7b4e0bdf09d7410346f19b49322321c362f2')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
