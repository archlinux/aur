# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.5.1"
_pkgver="0.5.1"
pkgrel="1"
pkgdesc="Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("e8e2ea152af42de0d60959351251387e5f3a4c885c27a064c5e23881fefeda86")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("ea2f2b8ac208b626d9051766b86363278fcab3e3f30e6968d864d35878f6aaf1")
backup=('var/lib/hornet/config.json' 'var/lib/hornet/config_comnet.json' 'var/lib/hornet/config_devnet.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
