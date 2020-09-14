# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.5.3"
_pkgver="0.5.3"
pkgrel="1"
pkgdesc="Powerful, community driven IOTA fullnode software written in Go (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("84a04f0f1dc946c02b90a3a6dd8503bd9d5f057191431f45f9f7401ff8c88f57")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("8fe06cf4668b6333f82853ca8e6c1d4330c60be43fc2f747d4823ca8ec59e0ab")
backup=('var/lib/hornet/config.json' 'var/lib/hornet/config_comnet.json' 'var/lib/hornet/config_devnet.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
