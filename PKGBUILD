pkgname='wago-app-bin'
pkgver='2.6.4'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.6.4.deb::https://wago-addons.ams3.digitaloceanspaces.com/wagoapp/WagoApp_2.6.4.deb)
sha512sums=('a6f7f8423578b130eb41255161ef865b305861690b1b2fbfb5d2e884430db4e84e1d29b9cfe9e6f15727dbda9d3f941b400d0d9219480c6dfe2bcf5d9e192433')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
