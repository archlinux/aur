# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
# Co-Maintainer: Melroy van den Berg <melroy at melroy dot org>
pkgname=winegui-bin
pkgver=4.5.1
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'gtkmm-4.0'
	'cabextract' # used by winetricks
	'unzip'
	'p7zip'
	'util-linux' # provides taskset
	'wget' # to download winetricks/Wine runner latest release
	'wine'
	'zenity' # used by winetricks
	'tar' # used to untar Wine runenr downloads
	'xz' # used to untar/xz/lzma Wine runner downloads
	'python' # used for UMU launcher (when using GE-Proton)
)
conflicts=('winegui')
provides=('winegui')
source=("$pkgname-$pkgver.tar.gz::https://winegui.melroy.org/downloads/WineGUI-v$pkgver.tar.gz")
md5sums=('54c35ee8df048daa7a3ed0489efc83dd')

package() {
	mkdir $pkgdir/usr
	mv WineGUI-v$pkgver/* "$pkgdir/usr/"
}
