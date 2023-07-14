# Maintainer: Funami
# Contributor Brodi <me@brodi.space>
pkgname=gnirehtet-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Gnirehtet provides reverse tethering for Android"
arch=('x86_64')
url="https://github.com/Genymobile/gnirehtet"
license=('Apache')
depends=('android-tools')
provides=('gnirehtet')
conflicts=('gnirehtet')
source=("https://github.com/Genymobile/gnirehtet/releases/download/v${pkgver}/gnirehtet-rust-linux64-v${pkgver}.zip"
        "https://raw.githubusercontent.com/Genymobile/gnirehtet/v${pkgver}/LICENSE"
        'gnirehtet.sh')
sha256sums=('dee55499ca4fef00ce2559c767d2d8130163736d43fdbce753e923e75309c275'
            '59f023291b5fa3b10141468200d3f477d91007f7d576c7af1bb22b0c5c6b48d1'
            'b22da8e1c4332aff8c4010ee96f08ee27f8932b04778cf4f301e0066f3b796fd')

package() {
  install -Dm755 gnirehtet.sh "${pkgdir}/usr/bin/gnirehtet"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gnirehtet/LICENSE"

  cd ${srcdir}/gnirehtet-rust-linux64
  install -Dm755 gnirehtet -t "${pkgdir}/usr/share/gnirehtet"
  install -Dm644 gnirehtet.apk -t "${pkgdir}/usr/share/gnirehtet"
}
