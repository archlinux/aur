# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=360player
pkgver=1.0.0.1006
pkgrel=1
pkgdesc="360 Video Player"
arch=('x86_64')
url="http://www.kylinos.cn/adaptation/application/15.html"
license=('custom')
depends=('hicolor-icon-theme' 'qt5-script' 'mplayer')
source=("http://update.cs2c.com.cn:8080/scs/soft_repo/${CARCH}/RPMS/${pkgname}-${pkgver}-${CARCH}/${pkgname}-${pkgver}-${CARCH}.rpm")
sha256sums=('3407e730d0aabe87bdef11f52485b7bfe7de2e11bac748e9a6096705d1d2f841')

package() {
  cd ${srcdir}

  # desktop entry
  install -Dm644 usr/share/applications/${pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # icons
  find usr/share/icons/hicolor -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # binary 
  install -Dm755 opt/${pkgname}/${pkgname} -t ${pkgdir}/opt/${pkgname}

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
# vim: set sw=2 ts=2 et:
