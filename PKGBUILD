# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparaksts-token-signing
pkgver=2.3.7
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
sha512sums=('d7af431e309a40d707e299032f7ad41d14d7c1f1a220e1b1c209bc01b8e682e60cbd6fc953955791bcf50733aa05e7a6f636da1a44c35c26ea92c7b6309e7f78')

package() {

  tar -xf data.tar.zst -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  # clean up some broken symbolic links
  rm "${pkgdir}/usr/share/chromium/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/chromium-browser/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"
  rm "${pkgdir}/usr/share/google-chrome/extensions/ecdpmdojhacnkledeihffppfimadpdcb.json"

}
