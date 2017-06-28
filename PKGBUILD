# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>

pkgname=rhythmbox-tray-icon
pkgver=0.2_1
pkgrel=4
pkgdesc="Rhythmbox tray icon functionality similar to 0.x series"
arch=('any')
url="http://github.com/palfrey/rhythmbox-tray-icon"
license=('GPL3')
depends=('rhythmbox>=2.90' 'python-cairo' 'gnome-icon-theme')
source=(https://github.com/downloads/palfrey/rhythmbox-tray-icon/rhythmbox-tray-icon_${pkgver//_/-}_all.deb)
sha256sums=('8636241bb6dabb28f4c50959f9e1b4be4a3bacee2e55d0fc59a005bbf7fdaffa')

package() {
  tar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
  sed -i -e 's/Loader=python/&3/' "$pkgdir"/usr/lib/rhythmbox/plugins/tray-icon/tray_icon.plugin
}

