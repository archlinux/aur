# Maintainer: Alejandro Oranday <alejandro at oran dot day>
_name="r2modman"
pkgname="r2modman-bin"
pkgver=3.2.19
pkgrel=1
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=('x86_64')
url="https://github.com/ebkr/r2modmanPlus"
license=('MIT')
depends=(c-ares ffmpeg gtk3 llhttp libevent libvpx libxslt libxss minizip nss re2 snappy libnotify
libappindicator-gtk3)
provides=("r2modman")
conflicts=("r2modman")
source=("${url}/releases/download/v${pkgver}/${_name}-$pkgver.pacman"
	"LICENSE")
sha256sums=(
	'4c8ecee3689490904ae4f9448f9555a984976665672ef70824486cdf38e04942'
	'ab4643c18a58edee5b0beac8278517f6475b2956d5999b40e3176297b9a0ce18'
)

package() {
	mv "$srcdir"/{opt,usr} "$pkgdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
}
