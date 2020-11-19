# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=finalcrypt
pkgver=6.5.0
pkgrel=1
pkgdesc="The World's Strongest Encryption"
arch=('x86_64')
url='http://www.finalcrypt.org'
license=('CCPL')
depends=('java-runtime>=8'
         'gtk2'
         'libnet'
         'ffmpeg'
         'gtk3')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::http://www.finalcrypt.org/downloads/linux/finalcrypt_linux_x86_64_debian_based.deb")
sha256sums=('65b3bafe0989e46577c3d73bc8828f722b5a0772a51c74b8e6d5f907789cd3aa')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop"
}
