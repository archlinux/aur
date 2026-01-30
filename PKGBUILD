# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=26.1.stable.lts
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
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-26.1-stable/Redot_v26.1-stable_linux_x64.zip")
sha256sums=('19b7b98726bc748a571bdedae51c980f2147837024b936fdc76139f0944bfcc0')

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
