pkgname='wago-app-bin'
pkgver='2.9.5'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.9.5.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.9.5.deb)
sha512sums=('ba558d7097cc82474bd1d1457478e53c3e05ef0a5168e217666eb99b44486ccb0eab0badbcb54d9199b4c9ae74bb598e4896b9ff7eab71776ff288f0efa6a54f')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
