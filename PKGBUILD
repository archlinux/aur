# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=3.3.0
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
sha256sums=('f4d52a79f0294d3561261c922840df57bde08ce29bfb255cc562eac4014d7beb')
sha256sums_x86_64=('693834b8811e9a4617f768a7f713b62d15fcdb79ee19aa06f36b7c8bfafee554')
sha256sums_armv7h=('7d679fa88fbe9d67ae87c472ac08357e6ec07141125de6120226e5f86942c621')
sha256sums_aarch64=('027752c7ce5135a76a1d15790aff17d27c2b3be6d8922e416e40717eb616fb6c')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname-${_pkgname}_$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
