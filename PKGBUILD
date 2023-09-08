# Maintainer: Matt Kasun <matt at netmaker.io>
pkgname=netclient-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://fileserver.netmaker.org'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('2fc31162f8ce9ce4b212bf6e7b6f800e111c513036bb06c0aa7ff65dc61da2c7')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
