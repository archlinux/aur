# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=fallout2-cursor-theme
pkgver=20230307
pkgrel=1
pkgdesc="Vector version of old Fallout 2 cursors, based on cursor-toolbox by charakterziffer"
arch=(any)
url="https://github.com/TerminalHash/Fallout2-Vector-Cursor"
license=('GPL3')
makedepends=(git inkscape xorg-xcursorgen python)
depends=()
source=('git+https://github.com/TerminalHash/Fallout2-Vector-Cursor.git')
md5sums=('SKIP')

build () {
	cd "Fallout2-Vector-Cursor"
        python render-pngs.py "svgs/template.svg"
        ./make.sh
}

package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "Fallout2-Vector-Cursor/Fallout2" "${pkgdir}/usr/share/icons/"
}
