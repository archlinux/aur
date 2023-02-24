# Maintainer: Roni Hokkanen <roni dot hokkanen at protonmail dot com>

pkgname=sdl2-csgo-wayland-bin
pkgver=2.0.14
pkgrel=1
pkgdesc='A version of SDL2 that is tested to work with CS:GO on Wayland. WARNING: You might get VAC banned by using a different SDL2 version in CS:GO.'
arch=('x86_64')
url='https://www.libsdl.org'
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libibus' 'hidapi' 'libusb')
makedepends=('git')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
	"libSDL2-csgo.tar.xz" # Compressed SDL2 to work around AUR file size limits
	"Readme.txt"
)

prepare() {
  tar --use-compress-program=unxz -xvf libSDL2-csgo.tar.xz
}

package() {
  install -Dm755 "${srcdir}/libSDL2-csgo.so" "${pkgdir}/usr/lib/libSDL2-csgo.so"
  install -Dm644 "${srcdir}/Readme.txt" "${pkgdir}/usr/share/doc/sdl2-csgo-wayland-bin/Readme.txt"
}

sha256sums=('58908b45fcaa6d7d53fcd5927ce7fa270dbc53a11fc06b2f7a3e0e0a66d43971'
            '88a790300f69e7bf5669fab53528f2a2cf03df0f4eec2bbc3c2431d1ba20937b')
