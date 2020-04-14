# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=kali-undercover
pkgver=2020.2.0
pkgrel=2
pkgdesc='Kali Undercover Mode'
arch=('any')
url='https://gitlab.com/kalilinux/packages/kali-undercover/'
license=('GPL3')
depends=('python-gobject' 'xfce4-session' 'xfce4-panel' 'xfdesktop' 'xfwm4' 'ttf-liberation' 'xfce4-settings')
optdepends=('xfce4-whiskermenu-plugin: for menu on undercover mode'
            'xfce4-datetime-plugin: for date and time on undercover mode'
            'xfce4-notifyd: for settings restored notification'
            'libnotify: for settings restored notification'
            'psmisc: for clearing existing notificaion')
source=(https://gitlab.com/kalilinux/packages/${pkgname}/-/archive/kali/${pkgver}/${pkgname}-kali-${pkgver}.tar.gz
	'kali-undercover.patch')
sha256sums=('906e7881da3be1756dcc77bcad2612eb53f2f5a17e1349c24fee060b7f522d14'
	    'f652a97f81712cfc81ad9f92478e6b6a8470e9097387e4cf4c84dd0b6b4bbdf8')

package() {
  cd ${pkgname}-kali-${pkgver}
  patch bin/kali-undercover ../kali-undercover.patch
  install -d "${pkgdir}/usr"
  cp -dr bin "${pkgdir}/usr/bin"
  cp -dr share "${pkgdir}/usr/share"
}
