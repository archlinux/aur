# Please report PKGBUILD bugs at
# https://github.com/ystein/archlinux-aur-packages

# Maintainer: Yannik Stein <yannik.stein [at] gmail.com>

pkgname=rhythmbox-tray-icon
pkgver=0.2_1
pkgrel=4
pkgdesc="Restores the tray icon functionality from the 0.x series. Please \
report PKGBUILD bugs at https://github.com/ystein/archlinux-aur-packages."

arch=('any')
url="http://github.com/palfrey/rhythmbox-tray-icon"
license=('GPL3')
depends=('rhythmbox>=2.90' 'python-cairo' 'gnome-icon-theme')
conflicts=('rhythmbox-git')
changelog=$pkgname.changelog
source=(https://github.com/downloads/palfrey/rhythmbox-tray-icon/rhythmbox-tray-icon_${pkgver//_/-}_all.deb)
md5sums=('2291a0bd18efdb3929b887f690752782')

package() {
  tar xfC "$srcdir/data.tar.gz" "$pkgdir"
  sed -i -e 's/Loader=python/&3/' \
    "$pkgdir/usr/lib/rhythmbox/plugins/tray-icon/tray_icon.plugin"
}

