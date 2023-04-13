# Maintainer: Mateusz Krawczynski <matikrawczpl@gmail.com>

pkgname=rewind-bin
pkgver=0.2.0
pkgrel=0
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
        "$pkgname.png::https://media.githubusercontent.com/media/abstrakt8/rewind/master/tools/electron-builder/build-resources/icon.png"
        "$pkgname-LICENCE.md::https://raw.githubusercontent.com/abstrakt8/rewind/master/LICENSE.md"
        "rewind.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('13a56a8cc1d62913a94184b7c89dc57bec1fc360d19503e62c10f8ed45eb6298'
            'cceae28fec491bf1306c40daad13eee832fed4d410e085b6b4e121392b257528'
            '18e5330dd98f639f915217afe123ec3fa625d61556dbace7d52bd2d2fbd2226b'
            'cf6de555412d62f0212857c4a3dd9bf4f686ac20224e18ccfe865098054f6a09')

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
