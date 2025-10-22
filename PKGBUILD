pkgname='wago-app-bin'
pkgver='2.8.0'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.8.0.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.8.0.deb)
sha512sums=('cfcbf3bdb2177e80aaae83dc255b8361841cc84a40afaf0482e2fd2cf17847618140c45b2b17f83cee8ad19aec38a6c6283c33f40871e9ccabaaa7b11a44a592')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
