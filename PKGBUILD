# Maintainer: Matt Kasun <matt at netmaker.io>
pkgname=netclient-bin
pkgver=0.20.4
pkgrel=0
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://fileserver.netmaker.org'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('5d361c5a998e4d5632e8bb0c3461897d66ead14db4558b1b97e0a4eb79953328')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
