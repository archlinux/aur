# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obextool
pkgver=0.35
pkgrel=5
pkgdesc="A front-end of obexftp"
arch=('any')
url='https://www.tech-edv.co.at/00_Home/20_Software/50_Freie~20Software/10_ObexTool'
license=('GPL')
depends=(
  'perl'
  'obexftp'
  'bwidget'
  'tklib'
  'tk'
  )
source=(  "https://www.tech-edv.co.at/TCMS/downloads/obextool-$pkgver.tar.gz")
sha256sums=('59592800fdcc1f789b86e48bea409cc38eeaa8ec2b5590d507a2f819a9b8555f')

package() {
  install -d "${pkgdir}/usr/"{share,bin}
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/"
  cd "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/obextool"
  echo "/usr/share/${pkgname}-${pkgver}/obextool.tk \"\$@\"" >> "${pkgdir}/usr/bin/obextool"
  chmod +x "${pkgdir}/usr/bin/obextool"
}
