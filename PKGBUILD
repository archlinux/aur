# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.3.beta.3
pkgrel=6
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-4.3-beta.3/Redot_v4.3-beta.3_linux.x86_64.zip")
sha256sums=('c6010a7db9b838349ffb8b2043a5958f49d4c880579fdbcf56ceb2c96d6c9657')

package() {
	cp ../Redot.desktop ${srcdir}
	cp ../icon.png ${srcdir}
	cp ../LICENSE.txt ${srcdir}
	cd "$srcdir"
	install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
	install -D -m755 Redot_v4.3-beta.3_linux.${arch} ${pkgdir}/usr/bin/redot
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
}

