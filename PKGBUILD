# Maintainer: Scott Harrison <scott.arch@scottrix.co.uk>

pkgname=pulseaudio-dummy
pkgver=0.2
pkgrel=1
pkgdesc='Dummy PulseAudio package to utilize apulse'
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('apulse')
provides=('pulseaudio' 'pulseaudio-alsa' 'libpulse' 'libpulse.so=0-64' 'libpulse-simple.so=0-64')
conflicts=(${provides[@]})

package() {
    mkdir -p ${pkgdir}/usr/lib
    for lib in libpulse-mainloop-glib.so libpulse-simple.so libpulse.so
    do
        ln -s apulse/${lib} "${pkgdir}/usr/lib/${lib}"
        ln -s apulse/${lib}.0 "${pkgdir}/usr/lib/${lib}.0"
    done
}

