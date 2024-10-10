# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.4.dev
pkgrel=3
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/decryptedchaos/redot-aur-bin/raw/refs/heads/main/redot-engine-4.4dev3.tar.gz")
sha256sums=('2af87873cc526fd7e3b4f1a3b31beea2eb9e49e670a1bdd09dbdd62cc5e6312d')

package() {
	cd "$srcdir"
	 install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	 install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
     install -D -m755 redot.linuxbsd.editor.${arch} ${pkgdir}/usr/bin/redot44
     install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
}

