# Maintainer: Pedro Gabriel (pedrogabriel@dcc.ufmg.br)
# Special Thanks: FadeMind (fademind@gmail.com)

pkgname=aic94xx-firmware
pkgver=30
pkgrel=8
_pkgrel=6
pkgdesc="Adaptec SAS 44300, 48300, 58300 Sequencer Firmware for AIC94xx driver"
url="http://pkgs.org/centos-7/centos-x86_64/aic94xx-firmware-30-6.el7.noarch.rpm.html"
license=('custom')
arch=('any')
source=("${pkgname}-${pkgver}.rpm::ftp://ftp.pbone.net/mirror/ftp.centos.org/7.1.1503/os/x86_64/Packages/${pkgname}-${pkgver}-${_pkgrel}.el7.noarch.rpm")
sha256sums=('1db12b5979cf561cb030c9d695969e5c4d76e55c0e1f8dd4795b86eddb3d3669')

build() {
  bsdtar xvf "${pkgname}-${pkgver}.rpm"
}

package() {
  install -Dm644 ${srcdir}/lib/firmware/aic94xx-seq.fw ${pkgdir}/usr/lib/firmware/aic94xx-seq.fw
  install -Dm644 ${srcdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.aic94xx ${pkgdir}/usr/share/doc/${pkgname}/LICENSE.aic94xx
  install -Dm644 ${srcdir}/usr/share/doc/${pkgname}-${pkgver}/README-94xx.pdf ${pkgdir}/usr/share/doc/${pkgname}/README-94xx.pdf
}
