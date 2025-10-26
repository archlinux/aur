# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Ulysses Ribeiro <ulyssesrr at gmail dot com>

pkgname="steam-rom-manager-bin"

_pkgdesc="An app for managing ROMs in Steam"
pkgdesc="${_pkgdesc} (extracted from Debian package)"

pkgver=2.5.30
pkgrel=1

arch=(x86_64)

url="https://github.com/SteamGridDB/steam-rom-manager"
license=("GPL-3.0-or-later")

depends=(gtk3 libnotify libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret)

provides=(steam-rom-manager)
conflicts=(steam-rom-manager-git steam-rom-manager-appimage)

source=("https://github.com/SteamGridDB/steam-rom-manager/releases/download/v${pkgver}/steam-rom-manager_${pkgver}_amd64.deb")
md5sums=(c385c71b6bf489b666f5c741968afd95)

package() {
	# extract the files from the Debian package
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	# make the directory for the symlink
	mkdir -p "${pkgdir}/usr/bin"

	# make a symlink to the executable
	ln -s "/opt/Steam ROM Manager/steam-rom-manager" "${pkgdir}/usr/bin/steam-rom-manager"
}
