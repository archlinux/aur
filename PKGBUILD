# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=tunnelbear
pkgver=1.0
pkgrel=1
pkgdesc="TunnelBear configuration for Linux"
arch=(any)
url="https://tunnelbear.com"
depends=('openvpn')
source=("https://s3.amazonaws.com/tunnelbear/linux/openvpn.zip")
md5sums=('44c9ced94111d6878b156975542b7b6e')

function package() {
	local DESTDIR="$pkgdir/etc/openvpn"
	local INSTALL="install -Dm u=rw,go="

	while read filename; do
		$INSTALL "openvpn/$filename" "$DESTDIR/$filename"
	done < <(find 'openvpn' -type 'f' -printf '%P\n')
}
