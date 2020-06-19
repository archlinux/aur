# Maintainer: Nico Beierle <nico dot beierle at gmail dot com>
pkgname="hornet-bin"
_pkgname="hornet"
pkgver="0.4.1_rc3"
_pkgver="0.4.1-rc3"
pkgrel="1"
pkgdesc="Powerful IOTA fullnode software (official precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/gohornet/hornet"
license=("Apache")
source_x86_64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums_x86_64=("a54caa7c7d8c310344caa1390a92bf6e2141281529912458a66adbc73d54861e")
source_aarch64=("https://github.com/gohornet/hornet/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_arm64.deb")
sha256sums_aarch64=("d6a9fd3d2cbea27ac8987b9807dafbc8f888ea23195a24022b03bfa5c1fd75ad")
backup=('var/lib/hornet/config_comnet.json' 'var/lib/hornet/config.json' 'var/lib/hornet/mqtt_config.json' 'var/lib/hornet/peering.json' 'var/lib/hornet/profiles.json' 'etc/default/hornet')
install=hornet.install

package() {
	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"
	
	# Systemd service must go to /usr/lib/...
	mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}
