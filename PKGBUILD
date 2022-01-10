# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.3.3
pkgrel=1
pkgdesc="eParaksts browser plugins"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('pcsclite' 'qt5-base')
optdepends=('latvia-eid-middleware: libraries for Latvia eID cards')
install='eparaksts.install'
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('c9544dfc17c5c9774eb244035c3bb9e6825ff5188c01f4550c1cc32ecc6942be865ecabab684909cb3fee7b728ca33262e9941a7571e2a3b174fe639a91ba60c')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  # clean up some broken symbolic links
  rm "${pkgdir}/usr/share/chromium/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/chromium-browser/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/google-chrome/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"

}
