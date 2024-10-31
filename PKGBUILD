# Maintainer: decryptedchaos <nixgod@gmail.com>

_pkgname="redot"
pkgname=${_pkgname}-bin
pkgver=4.3.beta.2
pkgrel=5
pkgdesc="A multi-platform 2D and 3D game engine"
arch=('x86_64')
url="https://github.com/Redot-Engine/redot-engine"
license=('MIT')
depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')
source=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-4.3-beta.2/Redot_v4.3-beta.2_linux.x86_64.zip")
sha256sums=('05fc1b5306bfb9f8e77f3d093d9897247a44b4cd2c540275acad9fc223e1bd5c')

package() {
	
	 install -Dm644 Redot.desktop ${pkgdir}/usr/share/applications/Redot.desktop
	 install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
     install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE
    cd "$srcdir"
     install -D -m755 Redot_v4.3-beta.2_linux.${arch} ${pkgdir}/usr/bin/redot
     
}

