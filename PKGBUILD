pkgname='wago-app-bin'
pkgver='2.9.6'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.9.6.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.9.6.deb)
sha512sums=('2e799792303f1dc4dad2d4c451ffcc2f103469058c84887f3dc99a36276db6b67ed322b6f0deba8b4f196d84768a0404a5014ced51f4f731cc29e84742123902')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
