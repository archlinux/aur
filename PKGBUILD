# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.5.4"
_pkgver="0.5.4"
pkgrel="1"
pkgdesc="Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("37ebc3b0b608c766b6edc46112eb4040adb5538e420366b3bebc032292317839")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("482a5f0dd848bff60e270da12598e1ccb8a830efeb21a871afe8d1697895eefe")
backup=('var/lib/hornet/config.json' 'var/lib/hornet/config_comnet.json' 'var/lib/hornet/config_devnet.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
