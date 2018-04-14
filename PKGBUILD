# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=toptracker
pkgver=1.5.2
_srcrel=198
pkgrel=1
pkgdesc="Time tracking software for remote teams and individuals"
arch=('x86_64')
url="https://www.toptal.com/tracker/"
license=(custom:toptracker)
depends=('qt5-svg'
         'qt5-multimedia'
         'libxss'
         'gtk2'
         'gtk3'
         'gcc-libs'
         'libappindicator-gtk2')
source=("https://d101nvfmxunqnl.cloudfront.net/desktop/builds/redhat/${pkgname}_${pkgver}-${_srcrel}_x86_64.rpm"
        'toptracker.desktop'
        'LICENSE')
noextract=("${pkgname}_${pkgver}-${_srcrel}_x86_64.rpm")
md5sums=('11a31218a4a4694f747a6c2ad50d920d'
         'a58411ebce05fdd699fb70aa53767564'
         '0a9b08905e1cc75c6b23e6055efb2881')

package() {
  bsdtar -xf ${srcdir}/${pkgname}_${pkgver}-${_srcrel}_x86_64.rpm -C ${pkgdir}/
  rm -r ${pkgdir}/etc/yum.repos.d
  rm ${pkgdir}/usr/share/applications/toptracker.desktop
  install -Dm755 ${srcdir}/toptracker.desktop ${pkgdir}/usr/share/applications
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
