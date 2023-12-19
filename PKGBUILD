# Maintainer: Alejandro Oranday <alejandro at oran dot day>
_name="r2modman"
pkgname="r2modman-bin"
pkgver=3.1.45
pkgrel=2
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=('x86_64')
url="https://github.com/ebkr/r2modmanPlus"
license=('MIT')
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify
libappindicator-gtk3)
provides=("r2modman")
conflicts=("r2modman")
source=("${url}/releases/download/v${pkgver}/${_name}-$pkgver.pacman"
	"LICENSE")
md5sums=(
	 'ebb16fd20ba7c7dc720d61647ed98fcb'
         'cdc88d3d1b56736d0dbc702aaa7de854')

package() {
	cp -r "$srcdir"/{opt,usr} "$pkgdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir "${pkgdir}/usr/bin"
	ln -sf "/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
}
