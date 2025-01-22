# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=3.0.0
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
sha256sums=('d1ce46d53ba4a61e59a2f589945e898aa3f96e7d666fb78d665b13398d94ae1b')
sha256sums_x86_64=('39b2ab9389d5b1774cc03df3a7e009a110ec0254e056fb86cea4a523f219e573')
sha256sums_armv7h=('9454834125de9df36bb5d446e11aa0ab03342e54ef25c732707262d7e1348808')
sha256sums_aarch64=('d452cfbe9cfae770936d4cd98b1da7b5b363f753c36b4dc7358e74561cecdf17')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname-${_pkgname}_$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
