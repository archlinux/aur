# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=fio_api_plus
pkgver=1.1.1
pkgrel=1
pkgdesc="Secure and automated processing of bank statements and transactions for accounts held at Czech Fio bank"
arch=('any')
url="http://www.fio.cz/bank-services/internetbanking-api"
license=('unknown')
depends=('java-runtime' 'ttf-font')
optdepends=('oxygen-icon: for application icon')
source=(http://www.fio.cz/apps/fio_api_plus.jar
        $pkgname.desktop $pkgname.sh)
sha256sums=('ffebb6e4008e044b4d552ee6d08828222512c21a520f95c2f16666b3eaa82ce9'
            'a60367fcd564a3389cc1425e970ee8f6d0f39235d9643eac7ea164b745f89d65'
            '6b33ff041dfded95cec9f7ba939f63c049cb9854c3d11c8e65afcb21a7bddc5f')

package() {
  cd "${srcdir}"

  install -Dm644 $pkgname.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar

#.desktop file
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
#executable file
  install -Dm755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
