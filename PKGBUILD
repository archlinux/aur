pkgname='wago-app-bin'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_3.0.0.deb::https://cdn.wago.io/wagoapp/WagoApp_3.0.0.deb)
sha512sums=('b00d089867db77e77e895542b8e9b5cea1ebb63e5bdf1cbf74a8f62c14cc9c2ac48880d8b79b5a7181f5b8946f16f6347529596748f2a22837126905683c6cc0')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
