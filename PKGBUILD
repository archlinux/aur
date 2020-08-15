# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.5.0_rc13"
_pkgver="0.5.0-rc13"
pkgrel="1"
pkgdesc="Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("bf48217f2691900621dc3e3ac1a9d878ba65358ade03695a9663993ca2c14bc0")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("754da81a0c7c01d38fce541247e6dae07c026c8f0fa3e35fe0b096c739ca4249")
backup=('var/lib/hornet/config.json' 'var/lib/hornet/config_comnet.json' 'var/lib/hornet/config_devnet.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
