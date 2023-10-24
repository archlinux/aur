# Maintainer: Matt Kasun <matt at netmaker.io>
pkgname=netclient-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://fileserver.netmaker.org'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('0f0d9d8123bfba17a5d40d865e57e810cbea7f18525bfb0e1d88ee83460528be')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
