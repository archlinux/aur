# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=toptracker
pkgver=1.4.6
_pkgrel=131
pkgrel=1
pkgdesc="Time tracking software for remote teams and individuals"
arch=('x86_64')
url="https://www.toptal.com/tracker/"
license=(custom)
depends=('qt5-svg'
         'qt5-multimedia'
         'libxss'
         'gtk2'
         'gtk3'
         'gcc-libs-multilib'
         'libappindicator-gtk2')
source=("https://d101nvfmxunqnl.cloudfront.net/desktop/builds/redhat/${pkgname}_${pkgver}-${_pkgrel}_x86_64.rpm"
        'toptracker.desktop'
        'LICENSE')
noextract=("${pkgname}_${pkgver}-${_pkgrel}_x86_64.rpm")
md5sums=('fce8c10bea197185b25d4f5fadeb7d77'
         'a58411ebce05fdd699fb70aa53767564'
         '0a9b08905e1cc75c6b23e6055efb2881')

package() {
  bsdtar -xf ${srcdir}/${pkgname}_${pkgver}-${_pkgrel}_x86_64.rpm -C ${pkgdir}/
  rm -r ${pkgdir}/etc/yum.repos.d
  rm ${pkgdir}/usr/share/applications/toptracker.desktop
  install -Dm755 ${srcdir}/toptracker.desktop ${pkgdir}/usr/share/applications
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
