# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=archlinux-themes-sddm
pkgver=1.0
pkgrel=1
pkgdesc="Adaptation to SDDM of archlinux-themes-kdm"
arch=('any')
url="http://www.archlinux.org/"
license=('CCPL:cc-by-sa')
depends=('sddm')
install="$pkgname.install"
source="https://github.com/Guidobelix/archlinux-themes-sddm/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
md5sums='ef56ca40150945838fd45edfc5513ab5'

package() {
  cd $pkgname-$pkgver
  for t in simplyblack soft-grey; do
    install -d "${pkgdir}"/usr/share/sddm/themes/archlinux-$t
    install -Dm644 archlinux-$t/{AUTHORS,COPYING,metadata.desktop,TRADEMARKS,archlinux.png,background.png,Main.qml,screenshot.png,angle-down.png,theme.conf} \
      "${pkgdir}"/usr/share/sddm/themes/archlinux-$t
  done
}
