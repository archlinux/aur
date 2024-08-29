# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Steam depot downloader utilizing the SteamKit2 library."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamRE/DepotDownloader"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'zlib')
provides=(${pkgname::20})
conflicts=(${pkgname::20})
source_x86_64=("$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-x64.zip")
source_armv7h=("$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-arm.zip")
source_aarch64=("$url/releases/download/${_pkgname}_${pkgver}/${_pkgname}-linux-arm64.zip")
sha256sums_x86_64=('6b19fe7b18c98b9ffe5ec5f6c5a1c3721d2f8515fdf64e67ba5905244edc1f2e')
sha256sums_armv7h=('bd0a632a84d53f9a09d3e950d7f1d5952b1b8dd8a6c28873eb5c1b570a662ba8')
sha256sums_aarch64=('b6f66f81a1954b7e3cc3ecfdfed771d7132f0cb498e884736a21cbdf12f68447')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
