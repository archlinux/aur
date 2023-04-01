# Maintainer: Alejandro Oranday <alejandro at oran dot day>
_name="r2modman"
pkgname="r2modman-bin"
pkgver=3.1.40
pkgrel=1
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=('x86_64')
url="https://github.com/ebkr/r2modmanPlus"
license=('MIT')
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify
libappindicator-gtk3)
provides=("r2modman")
conflicts=("r2modman")
source=("${url}/releases/download/v${pkgver}/${_name}-$pkgver.tar.gz"
	"LICENSE")
md5sums=(
	'77747a10071f8d3ee4bd3f4864d76575'
	'cdc88d3d1b56736d0dbc702aaa7de854')

package() {
	mkdir -p ${pkgdir}/opt/r2modman ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/licenses/${pkgname}
	cp -r ${srcdir}/${_name}-${pkgver}/* "${pkgdir}/opt/r2modman/."
	cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/."

	ln -s "/opt/r2modman/r2modman" "${pkgdir}/usr/bin/r2modman"
}
