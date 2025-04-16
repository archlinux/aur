# Maintainer: JarzaClay <icdubs09+aur at gmail dot com>
_name="r2modman"
pkgname="r2modman-other-bin"
pkgver=3.1.57
pkgrel=1
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore. Adds compatibility for games not owned via steam."
arch=('x86_64')
url="https://github.com/SprigWave/r2modmanPlus"
license=('MIT')
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify
libappindicator-gtk3)
provides=("r2modman")
conflicts=("r2modman")
source=("${url}/releases/download/${pkgver}/${_name}-$pkgver.pacman"
	"LICENSE")
md5sums=(
	'16c761c8ce00bb87826e4bdbf95de06c'
        'cdc88d3d1b56736d0dbc702aaa7de854')

package() {
	mv "$srcdir"/{opt,usr} "$pkgdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
}

