# Maintainer: Ben Poest <ben@poest.com>
# Contributor: David Wu <xdavidwuph@gmail.com>

pkgname=kali-undercover
pkgver=2023.1.0
pkgrel=1
pkgdesc='Kali Undercover Mode. Makes your xfce desktop look like Windows 10.'
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
sha256sums=('81bc026de2f6c0d4597d0a8cbbeb398cd82ce9a235e085674f7328be21a08e2c'
            'f652a97f81712cfc81ad9f92478e6b6a8470e9097387e4cf4c84dd0b6b4bbdf8')

package() {
  cd ${pkgname}-kali-${pkgver}
  install -d "${pkgdir}/usr"
  cp -dr bin "${pkgdir}/usr/bin"
  cp -dr share "${pkgdir}/usr/share"
}
