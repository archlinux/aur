# Maintainer: titangold <titangold at joec dot de>
pkgname="mqtt-explorer-bin"

pkgdesc="A comprehensive and easy-to-use MQTT Client"

pkgver=0.4.0_beta.6
pkgrel=1

arch=(x86_64)

url="https://github.com/thomasnordquist/MQTT-Explorer"
license=("CCPL:by-nd")

depends=()

provides=(mqtt-explorer)
conflicts=(mqtt-explorer mqtt-explorer-beta)

source=("https://github.com/thomasnordquist/MQTT-Explorer/releases/download/${pkgver//_/-}/MQTT-Explorer_${pkgver//_/-}_amd64.deb")
md5sums=("75521ffee7c8f243a1ea95fcb5a4fad3")

package() {
	# extract the files from the Debian package
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	# make the directory for the symlink
	mkdir -p "${pkgdir}/usr/bin"

	# make a symlink to the executable
	#ln -s "/opt/mqtt-explorer/mqtt-explorer" "${pkgdir}/usr/bin/mqtt-explorer"
}

