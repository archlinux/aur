# Maintainer Kiernan Preve <kiernanpreve@gmail.com>

pkgname=rtl8188gu-dkms-git
pkgver=r14.23b04ff
pkgrel=1
pkgdesc="Driver for Realtek RTL8188GU chipset wireless cards"
arch=('any')
url="https://github.com/KierPrev/rtl8188gu"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("rtl8188gu-dkms")
conflicts=("rtl8188gu-dkms")
source=("git+https://github.com/KierPrev/rtl8188gu.git")
sha256sums=('SKIP')



prepare() {
  cd rtl8188gu
  sed -e "s/@PKGVER@/${pkgver}/" -i dkms.conf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd rtl8188gu
  install -d "${pkgdir}/usr/src/rtl8188gu-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/rtl8188gu-${pkgver}/"
}
