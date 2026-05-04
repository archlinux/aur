pkgname='wago-app-bin'
pkgver='2.9.11'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.9.11.deb::https://cdn.wago.io/wagoapp/WagoApp_2.9.11.deb)
sha512sums=('fc000be0a1eac70f402f445afc8fc7ad288dcd08a75f85b2d15943979809ae82af7312cb6badf0393e4a8462018fea6387156c29acbedd47bcc7ee72a9403903')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
