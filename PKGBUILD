# Maintainer: matt kasun <matt  at gravil.com>
pkgname=netclient
pkgver=0.14.3
pkgrel=0
pkgdesc="netclient daemon - a platform for modern, blazing fast virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netmaker'
license=("custom:SSPL")
depends=('wireguard-tools')
makedepends=('go')

source=("${pkgver}-2.tar.zst::${url}/releases/download/v${pkgver}/netclient-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('9ddbb80bb15f8791aa0c9b8ae3fa71fb0b4b59ee11d28e302d4f8ba547d6571e')


package() {
	install -Dm755 "${srcdir}/usr/bin/netclient" "$pkgdir/usr/bin/netclient"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/netclient.service" "$pkgdir/usr/lib/systemd/system/netclient.service"
}
