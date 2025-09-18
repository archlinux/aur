pkgname='wago-app-bin'
pkgver='2.6.6'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.6.6.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.6.6.deb)
sha512sums=('5e29fdc0c2ec1d4b45856defce976ab68b5cca5e9a4f6908297c295986a39a2142c35426dff8fead5c7c5c2d12d51e446648c2be96487929970192e6989ebe73')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
