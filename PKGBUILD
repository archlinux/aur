# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=tunnelbear
pkgver=1.0
pkgrel=1
pkgdesc="TunnelBear OpenVPN configuration for Linux"
arch=('i684' 'x86_64')
url="https://tunnelbear.com"
depends=('openvpn')
source=("https://s3.amazonaws.com/tunnelbear/linux/openvpn.zip")
md5sums=('ad9496eda6ae9f0e22f16bb722db6ba4')

function package() {
	local DESTDIR="$pkgdir/etc/openvpn"
	local INSTALL="install -Dm u=rw,go="

	while read filename; do
		$INSTALL "openvpn/$filename" "$DESTDIR/$filename"
	done < <(find 'openvpn' -type 'f' -printf '%P\n')
}
