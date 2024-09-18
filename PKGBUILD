# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-ume
_pkgname=fonts-horai-umefont
pkgver=0.670
_pkgver=${pkgver:2}
pkgrel=4
pkgdesc="Free Japanese Gothic/Mincho font family (梅ゴシック／梅明朝フォント)"
arch=('any')
url="https://osdn.net/projects/ume-font/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(http://ftp.debian.org/debian/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${_pkgver}.orig.tar.xz)
b2sums=('ad46d5adddbc6def06f4b50412411580dd4ca712fdb5082869aaf507877e0eb3ee0b9d4cf597b4c2b54efa477d1309e41aca77b6dfb93beb4b7f1067daa3c346')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 ${_pkgname}-${_pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 ${_pkgname}-${_pkgver}/license.html \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.html
}
