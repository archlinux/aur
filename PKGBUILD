# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=xfce4-whiskermenu-plugin-button
pkgver=1.0.1
pkgrel=0
pkgdesc="Make the button valid without the xfce4-session in xfce4-whiskermenu-plugin."
arch=('any')
url="https://github.com/fkxxyz/archlinux-config/xfce4-whiskermenu-plugin-button"
license=('GPL3')
depends=('xfce4-whiskermenu-plugin')
source=()
conflicts=('xfce4-session')
md5sums=()
install=${pkgname}.install
backup=(etc/xdg/xfce4/whiskermenu/{xflock4,xfce4-session-logout})

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/etc/xdg/xfce4/whiskermenu"
  for file in xflock4 xfce4-session-logout; do
    ln -s /etc/xdg/xfce4/whiskermenu/$file "${pkgdir}/usr/bin/$file"
    echo -e "#!/bin/bash\n\n" > "${pkgdir}/etc/xdg/xfce4/whiskermenu/$file"
    chmod 755 "${pkgdir}/etc/xdg/xfce4/whiskermenu/$file"
  done
}

# vim:set ts=2 sw=2 et:
