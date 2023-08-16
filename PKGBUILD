# Maintainer: Matt Kasun <matt at netmaker.io>
pkgname=netclient-bin
pkgver=0.20.6
pkgrel=1
pkgdesc="A component of netmaker"
arch=(x86_64)
url='https://fileserver.netmaker.org'
license=("custom:SSPL")
depends=('wireguard-tools')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('81786d776ef96d6dc5b6846b038dba372974929d829defa182b899e6f3ffa129')

package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
