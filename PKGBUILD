# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.4.dev
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
makedepends=(git alsa-lib scons wayland yasm)
source=("https://github.com/decryptedchaos/redot-aur-bin/raw/refs/heads/main/redot-4.4dev1.tar.gz")
sha256sums=('1d08042b19496aa3a9a91ec012b791bdbd240d30b3caf3a930b8232465fb0609')

package() {
	cd "$srcdir"
	 install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	 install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
     install -D -m755 redot.linuxbsd.editor.${arch} ${pkgdir}/usr/bin/redot44
     install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
}

