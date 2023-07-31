# Maintainer: Matt Kasun <matt at netmaker.io>
pkgname=netclient-bin
pkgver=0.20.5
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://fileserver.netmaker.org'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('546114154f60d9d4bc7cda155a164e2dd60545cb782ad416ef72cc939f00d5ce')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
