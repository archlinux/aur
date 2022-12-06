# Maintainer: matt kasun <matt  at netmaker.io>
pkgname=netclient
pkgver=0.17.0
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}-${pkgrel}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('a19aa1817bd02c84020af55bdf60719a849c2766850a46341f2819ad2b7ab1f4')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
