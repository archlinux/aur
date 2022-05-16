# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.14.0
pkgrel=1
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')
makedepends=('go')

source=("${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('243b7b1fd25a4ae1f03ee19a560f68b4685f35fd9bb3a68ffaba7cfe49bac23f')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
