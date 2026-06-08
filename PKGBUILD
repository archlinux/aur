pkgname='wago-app-bin'
pkgver='2.12.1'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.12.1.deb::https://cdn.wago.io/wagoapp/WagoApp_2.12.1.deb)
sha512sums=('7968eb5216cbd6e7cd084f8bf5b9acd08c2f05911f87b48fa82891477813a992e3e8800dfddbd54c01ddbf921b9bef2839e37b074baed5e0ecf4067831435a55')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
