# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.4.stable
pkgrel=1
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-4.4-stable/Redot_v4.4-stable_linux.x86_64.zip")
sha256sums=('7d8b0c8fd044cda0bc542bd5800b95bc99b681b0d70d481e9dbff4a5ccfb833a')

package() {
	cp ../Redot.desktop ${srcdir}
	cp ../icon.png ${srcdir}
	cp ../LICENSE.txt ${srcdir}
	cd "$srcdir"
	install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
	install -D -m755 redot.linuxbsd.editor.${arch} ${pkgdir}/usr/bin/redot
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
}
