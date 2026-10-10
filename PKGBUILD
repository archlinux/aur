pkgname='wago-app-bin'
pkgver='2.14.1'
pkgrel='1'
pkgdesc='Wago App built from DEB release'
license=('custom:Wago-License')
arch=('x86_64')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)
optdepends=(libappindicator-gtk3)
source=(WagoApp_2.14.1.deb::https://cdn.wago.io/wagoapp/WagoApp_2.14.1.deb)
sha512sums=('f6ff9059155ae93eeef14a350ffcfac0aab472b707676cc7e36ab7ba8c85d975a45f4828660873b0a2d68635b19e624891f070fd2605fac738dca12dc34b7f3e')

package() {
  echo 'All Rights Reserved The Wago Dev Team <support@wago.io>' >> LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
}
