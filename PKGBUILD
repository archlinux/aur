# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=archlinux-themes-sddm
pkgver=1.1
pkgrel=1
pkgdesc="Adaptation to SDDM of archlinux-themes-kdm"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('sddm')
install="$pkgname.install"
source="https://github.com/Guidobelix/archlinux-themes-sddm/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='4481d85d8635b410b29bae64fbdc7cd9'

package() {
  cd $pkgname-$pkgver
  for t in simplyblack soft-grey; do
    install -d "${pkgdir}"/usr/share/sddm/themes/archlinux-$t
    install -Dm644 archlinux-$t/{AUTHORS,COPYING,metadata.desktop,TRADEMARKS,archlinux.png,background.png,Main.qml,screenshot.png,angle-down.png,theme.conf} \
      "${pkgdir}"/usr/share/sddm/themes/archlinux-$t
  done
}
