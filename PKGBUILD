## Maintainer: David Husička <contact@bydave.net>
## Contributor: Tyler Nelson <neo@cybercat.cc>

pkgname=osu-lazer-bin
pkgver=2022.418.0
pkgrel=1
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
arch=('x86_64')
url="https://osu.ppy.sh"
license=('MIT' 'custom:CC-BY-NC 4.0')
groups=()
depends=(ffmpeg zlib libgl fuse2 osu-mime)
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
sha256sums=("b746bd679ee2cdb624da6c1202c0a3e6152adb63be8db99b9f62a6c67674bd88"
            "36f73cfe0a84cd65a8bb54fcde5a01c419b134bee4a88cc92eb4f33236343a10"
            "30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244"
            "09a894825e61bbf27225e596820b23f3ddc83fd13904395e925456e08d690bea")

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
