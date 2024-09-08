# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=fio_api_plus
pkgver=1.1.4
pkgrel=1
pkgdesc="Secure and automated processing of bank statements and transactions for accounts held at Czech Fio bank"
arch=('any')
url="http://www.fio.cz/bank-services/internetbanking-api"
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
optdepends=('oxygen-icons: for application icon')
source=(https://www.fio.cz/apps/fio_api_plus.jar
        https://www.fio.cz/docs/cz/fio_api_plus.pdf
        $pkgname.desktop $pkgname.sh)
noextract=('fio_api_plus.jar')
sha256sums=('ce83bdb7d3f8cb623997aa91c0194579d08515ea24ea228e93ee2f691ea2aa66'
            '27b5356a4d05ccc95cdf85ba070eb8fc7e391b3470f5f0fab49dec15e4ec4428'
            'a60367fcd564a3389cc1425e970ee8f6d0f39235d9643eac7ea164b745f89d65'
            '6b33ff041dfded95cec9f7ba939f63c049cb9854c3d11c8e65afcb21a7bddc5f')

package() {
  cd "${srcdir}"

  install -Dm644 $pkgname.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar
  install -Dm644 $pkgname.pdf "${pkgdir}"/usr/share/doc/$pkgname/$pkgname.pdf

#.desktop file
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
#executable file
  install -Dm755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
