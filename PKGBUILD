# Maintainer: Carlos Pita <carlosjosepita@gmail.com>

pkgname=adapta-nokto-dropbox-icons
pkgver=20180702
pkgrel=1
pkgdesc="Dropbox PNG icons generated from Papirus Adapta Nokto SVG files"
arch=('any')
license=("LGPL3")
makedepends=('papirus-icon-theme' 'imagemagick')

package() {
    for size in 16x16 22x22 24x24; do
	from=/usr/share/icons/Papirus-Adapta-Nokto/$size/panel
	to=$pkgdir/usr/share/icons/hicolor/$size/status
	mkdir -p $to
	for icon in blank busy2 busy idle logo x; do
	    convert -background none $from/dropboxstatus-$icon.svg \
		                     $to/dropboxstatus-$icon.png
	done
    done
}
