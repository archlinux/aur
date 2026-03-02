pkgname='wago-app-bin'
pkgver='2.9.10'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.9.10.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.9.10.deb)
sha512sums=('3f07a3e2ab6fc9af4091939ddc359d5310c5b23709fdf5f680d0e2944636e26f2a7f395a3aad72608ed8b3564b1bf9262f79c0e1196aa76eaa40f9783af35f0a')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
