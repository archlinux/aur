# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.14.2
pkgrel=2
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')
makedepends=('go')

source=("${pkgver}-2.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('eab5c4d80829e1ef365e5d502a5db8947843ccc52453a4d0ba21fd0f37906129')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
