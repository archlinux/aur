# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=DepotDownloader
pkgname=steamdepotdownloader-bin
pkgver=2.7.4
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
sha256sums_x86_64=('13f3ada4a60a56a82eb8254ebba9de64b860f904540612a58803401934530908')
sha256sums_armv7h=('91881e4a5effbe03cc92e721ee8f6ac6b5a46134c7a7ab2babbc96935c584742')
sha256sums_aarch64=('b72328bb4ac4ffb8a64ba54f248a7dfb86834e9acf745b76312f6a5251546022')
options=('!strip')

package() {
	install -Dm755 ${_pkgname} "$pkgdir/usr/bin/depotdownloader"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
