pkgname='wago-app-bin'
pkgver='2.6.5'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.6.5.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.6.5.deb)
sha512sums=('3aa3961bc278dee27857064559f43354c0a218e7328438de0cc1617ec33c5f56675d329d28b84dae7b08e9fb2093d87779361739e3bf8f9ff6e7275e6008404c')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
