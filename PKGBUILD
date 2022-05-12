# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
# Based off of the "nbtexplorer" AUR package, maintained by Jochem Broekhoff with contributions by Alan Jenkins.

pkgname=nbtexplorer-bin
pkgver=2.8.0
pkgrel=3
pkgdesc="Minecraft NBT Editor for editing player and world files. (Binary version)"
arch=('i686' 'x86_64')
url="https://github.com/jaquadro/NBTExplorer"
license=('MIT')
depends=('mono')
options=('!strip')
provides=("nbtexplorer")
conflicts=("nbtexplorer")

source=(nbtexplorer-${pkgver}.zip::https://github.com/jaquadro/NBTExplorer/releases/download/v${pkgver}-win/NBTExplorer-${pkgver}.zip
		nbtexplorer
		nbtexplorer.png
		nbtexplorer.desktop)

sha256sums=('1bf4c3e56a0e8fba911c6c73cc12fbf105c01367d92dcfb9d20b0f529a666e4b'
            '71ab50b6d72b30402f9c1796c43b7541308cec89ae07761e10d68ab81138492b'
            'f14cc58c71f0c8afef75f5b31ec441835aa7c8702530f469679215ae9c94e4c2'
            'd3390cc6b5a61d27cd24da8f0fa19d33e941bd626a633b364105ba23c2f13ae6')

package() {
	local pkgshare="${pkgdir}/usr/share/nbtexplorer/"

	# Binaries and libraries
	install -D -m644 "${srcdir}/NBTExplorer.exe"		"${pkgshare}/NBTExplorer.exe"
	install -D -m644 "${srcdir}/NBTExplorer.exe.config"	"${pkgshare}/NBTExplorer.exe.config"
	install -D -m644 "${srcdir}/Substrate.dll"			"${pkgshare}/Substrate.dll"
	install -D -m644 "${srcdir}/NBTModel.dll"			"${pkgshare}/NBTModel.dll"

	# Launch script
	install -D -m755 "${srcdir}/nbtexplorer"			"${pkgdir}/usr/bin/nbtexplorer"

	# Desktop launcher with icon
	install -D -m644 "${srcdir}/nbtexplorer.desktop"	"${pkgdir}/usr/share/applications/nbtexplorer.desktop"
	install -D -m644 "${srcdir}/nbtexplorer.png"		"${pkgdir}/usr/share/pixmaps/nbtexplorer.png"
}
