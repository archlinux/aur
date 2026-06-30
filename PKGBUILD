# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=26.2.stable.lts
pkgrel=2
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-26.2-stable/Redot_v26.2-stable_linux_x64.zip")
sha256sums=('f474d890806c41af15513cf5a8600243e241882e11b68dbb95660e3465b5b1e4')

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
