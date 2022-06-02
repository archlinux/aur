# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.14.2
pkgrel=1
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')
makedepends=('go')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('2372b9fc7783a2158472075198e61dd3de190338ba3ba31b218e692fa0fcdf39')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
