pkgname='wago-app-bin'
pkgver='2.6.7'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.6.7.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.6.7.deb)
sha512sums=('e728d7d07a81f0ef5dc5302959d09d10281e77b34fcfd72d89402a7b930def92783d5b4cf0a73a963d68f651843fa9c4f8dae54aa25fd5672448e9a57c4d8647')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
