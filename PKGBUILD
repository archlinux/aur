# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.4.1_rc4"
_pkgver="0.4.1-rc4"
pkgrel="1"
pkgdesc="Powerful IOTA fullnode software (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("3422440edd5a592efd55128668182d84f5335e3b1e8648febe335c5917910cfc")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("1b6c20e9ce2181b72805b7a256ec8e7dbfb085e0af67271e03f2b371e07c3bf5")
backup=('var/lib/hornet/config_comnet.json' 'var/lib/hornet/config.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
