# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.3.stable.2
pkgrel=4
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-4.3.1-stable/Redot_v4.3.1-stable_linux.x86_64.zip")
sha256sums=('bad76b53e1854648fba3f3b631b996a160e58f1b73076e1e9b1854f8d1ac6f05')

package() {
	cp ../Redot.desktop ${srcdir}
	cp ../icon.png ${srcdir}
	cp ../LICENSE.txt ${srcdir}
	cd "$srcdir"
	install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
	install -D -m755 Redot_v4.3.1-stable_linux.${arch} ${pkgdir}/usr/bin/redot
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
}
