# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'zlib')
provides=(${pkgname::20})
conflicts=(${pkgname::20})
source=("$url/archive/refs/tags/DepotDownloader_${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-$pkgver-linux-x64.zip::$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-x64.zip")
source_armv7h=("${_pkgname}-$pkgver-linux-arm.zip::$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-arm.zip")
source_aarch64=("${_pkgname}-$pkgver-linux-arm64.zip::$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-arm64.zip")
sha256sums=('1164322265eace41cf1b2fec2d1127f750a9281b35d0337b7708f53cdd244451')
sha256sums_x86_64=('2f55e4c13440e699549b211cfc64ed938da4759f997f04ac5c84e0ba9b6d808b')
sha256sums_armv7h=('4a1fcdec1410ea7475453bd6bd0f7f8e8da329406d7b68a1af7721c231b226df')
sha256sums_aarch64=('c93a74087cb0b82f95216820debf0cacedd79a6aa260d8bf6ad20662a4bf337b')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname-${_pkgname}_$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
