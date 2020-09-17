# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.2.2
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
sha512sums=('ba2f300931eb7f165d06d5f26929fd7d6661098e873e38e960b65dfc5863966ac0b54f349f17386be79b9ff5fad0c7e3004c3d62cc49c449b62481819e0b6a94')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  # clean up some broken symbolic links
  rm "${pkgdir}/usr/share/chromium/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/chromium-browser/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/google-chrome/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"

}
