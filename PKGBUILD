# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.3.5
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
sha512sums=('ba7ab23f6d7e89552e7cca1b0a6a54a82b38cab5ef65c55bb2e305f2cd155dd60490f9ed2c945a28ac6b51067bc64f8045d61d72ce0d872162ad0ee9d8821379')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  # clean up some broken symbolic links
  rm "${pkgdir}/usr/share/chromium/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/chromium-browser/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/google-chrome/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"

}
