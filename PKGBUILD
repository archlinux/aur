pkgname='wago-app-bin'
pkgver='2.13.0'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.13.0.deb::https://cdn.wago.io/wagoapp/WagoApp_2.13.0.deb)
sha512sums=('a700c2ec38406271eeeeddfa78f760285bf6c0e3940ccbdd5bd6fb74838785f6d8b9bf34eb52877f8f7af0146bd22857fa5922505a9d5f7cb2203fe31b079658')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
