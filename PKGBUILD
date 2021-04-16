## Maintainer: David Husička <contact@bydave.net>

pkgname=osu-lazer-bin
pkgver=2021.416.0
pkgrel=1
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
arch=('x86_64')
url="https://osu.ppy.sh"
license=('MIT' 'custom:CC-BY-NC 4.0')
groups=()
depends=(ffmpeg zlib libgl sdl2 fuse2)
makedepends=()
checkdepends=()
optdepends=()
provides=(osu-lazer)
conflicts=(osu-lazer)
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver.AppImage::https://github.com/ppy/osu/releases/download/$pkgver/osu.AppImage"
        "$pkgname.png::https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png"
        "$pkgname-LICENCE.md::https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
        "osu-lazer.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=("617d818f8c0b5191abd470f5ee9d86113f1e759bc3a409dbef10965d20b41470"
            "36f73cfe0a84cd65a8bb54fcde5a01c419b134bee4a88cc92eb4f33236343a10"
            "30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244"
            "026a1db53b94cea60d30079e0050140096e3d1ef9b2a2035d8acafa04d9519d5")

package() {
	 # Install image
	 install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/osu-lazer.png

	 # Install license
	 install -Dm644 "${srcdir}"/"${pkgname}"-LICENCE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENCE.md

	 # Install desktop file
	 install -Dm644 osu-lazer.desktop "${pkgdir}"/usr/share/applications/osu-lazer.desktop

	 # Install binary
	 install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}".AppImage "${pkgdir}"/usr/bin/osu-lazer

}
