# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.3.9
pkgrel=2
pkgdesc="eParaksts browser plugins"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL-2.1-or-later')
groups=('eparaksts')
depends=('pcsclite' 'qt5-base')
optdepends=('latvia-eid-middleware: libraries for Latvia eID cards')
install='eparaksts.install'
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('ab87619acde07248ad23770023cdd7f83d75314f556be539e8ea8c492e1fdeca1113e6c838e1f15041f988217fea37b6bbf3f1c4559320cc3e01af4be9376ba7')

package() {

  tar -xf data.tar.zst -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  # clean up some broken symbolic links
  rm "${pkgdir}/usr/share/chromium/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/chromium-browser/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/google-chrome/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"

}
