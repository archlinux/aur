# Maintainer: Mateusz Krawczynski <matikrawczpl@gmail.com>

pkgname=rewind-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Rewind is a beatmap/replay analyzer for osu!"
arch=('x86_64')
url="https://github.com/abstrakt8/rewind"
license=('MIT')
groups=()
depends=(zlib)
makedepends=()
checkdepends=()
optdepends=()
provides=(rewind)
conflicts=(rewind)
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver.AppImage::https://github.com/abstrakt8/rewind/releases/download/v$pkgver/Rewind-$pkgver.AppImage"
        "$pkgname.png::https://raw.githubusercontent.com/abstrakt8/rewind/master/tools/electron-builder/build-resources/icon.png"
        "$pkgname-LICENCE.md::https://raw.githubusercontent.com/abstrakt8/rewind/master/LICENSE.md"
        "rewind.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('1e82c45c56d2f6d601115372b9460a8fbd72bda8e5dd057fefd2a56154015024'
            'cceae28fec491bf1306c40daad13eee832fed4d410e085b6b4e121392b257528'
            '18e5330dd98f639f915217afe123ec3fa625d61556dbace7d52bd2d2fbd2226b'
            'd3f8cc522812782bd656ca3bbc81cb96f0de2cb3fdda312fd8a4cace6b64de67')

package() {
	 # Install image
	 install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/rewind.png

	 # Install license
	 install -Dm644 "${srcdir}"/"${pkgname}"-LICENCE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENCE.md

	 # Install desktop file
	 install -Dm644 rewind.desktop "${pkgdir}"/usr/share/applications/rewind.desktop

	 # Install binary
	 install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/rewind

}
