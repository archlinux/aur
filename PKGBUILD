# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.5.6"
_pkgver="0.5.6"
pkgrel="1"
pkgdesc="Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("03935769fcea24c9eaddb25210f493673e9561b1b3b2b3df4afec15e8c0e0e47")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("e759c7605c03d221003c26d09ead16e07e18499dfad3cb3dbecaf36ccbff1fd5")
backup=('var/lib/hornet/config.json' 'var/lib/hornet/config_comnet.json' 'var/lib/hornet/config_devnet.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
