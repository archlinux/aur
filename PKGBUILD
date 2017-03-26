# Maintainer: Pablo Lezaeta <prflr 88 (Arro'a) gmail puntocom>

pkgname=lostconstellation
pkgver=1.1
pkgrel=1
pkgdesc="Travel into the frozen woods in a folktale from the world of Night In The Woods."
arch=("i686" "x86_64")
url="http://finji.itch.io/lost-constellation"
license=("Custom:propietary")
# Note: I think Xorg should be added since this cant run in headless system... but which xorg package
#       shall be the mesa or xorg-server or xorg-common?
depends=("gtk2" "glu")
source=("file:///Lost Constellation 1.1 (Linux).zip"
	# The game is a "Pay What You Want" with minimum at $0, grab first the file from the
	# url and place it within the same directory as this pkgbuild and the other files.
	"lostconstellation.sh"
	"lostconstellation.desktop")

package() {
	cd "${srcdir}"

	# First move the important files
	mkdir -p "${pkgdir}/usr/share/lostconstellation"
	cp -vR "${srcdir}/Lost Constellation_Data"	"${pkgdir}/usr/share/lostconstellation/"
	cp -vR "${srcdir}/Lost Constellation.x86"	"${pkgdir}/usr/share/lostconstellation/"
	cp -vR "${srcdir}/Lost Constellation.x86_64"	"${pkgdir}/usr/share/lostconstellation/"

	# Then move the bin file
	install -Dm677 "${srcdir}/lostconstellation.sh"	"${pkgdir}/usr/bin/lostconstellation"
	chmod +x "${pkgdir}/usr/bin/lostconstellation"

	# Move the desktop file
	# TODO: automate this like some packages in official repo
	install -Dm677 "lostconstellation.desktop"	"${pkgdir}/usr/share/applications/lostconstellation.desktop"
	install -Dm677 "${srcdir}/Lost Constellation_Data/Resources/UnityPlayer.png"	"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

sha1sums=('8e13931828f8fefb7990b9315bae91e739db39d3'
          '51d5fdc20d0eb1ee68da1407389eeb5617247153'
          '73438c59ca144b551a48cf543a1b37154c968db6')

