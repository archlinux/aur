# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=3.4.0
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
sha256sums=('2f09a0aaf003ee01fce44ec9acc0371441172e27d544eb7ccbe7974c01f47f42')
sha256sums_x86_64=('a999dec66b4850fc961bd50366696d23c2d0fad7b18790e6a5647b2f19097a53')
sha256sums_armv7h=('6cd66cd4f4f1e99ca2b30ca5ce097545d93bdad1fa754d9a74d8738e9e4e1022')
sha256sums_aarch64=('d9fb612ccebc1db8eeea3b4045d2221ec70431381393ce908fb72f01d4f9c812')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname-${_pkgname}_$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
