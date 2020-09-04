# Maintainer: hexchain <i at hexchain dot org>

pkgbase=pipewire-dropin
pkgname=("pipewire-pulse-dropin" "pipewire-jack-dropin")
pkgver=0.0.1
pkgrel=1
pkgdesc="Use pipewire as drop-in replacement for PulseAudio/JACK"
license=("LGPL2.1")
arch=(any)

package_pipewire-pulse-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for PulseAudio"
    provides=("libpulse" "pulseaudio")
    depends=("pipewire-pulse")

    install -dm755 "$pkgdir/usr/lib"
    for lib in libpulse-mainloop-glib libpulse-simple libpulse; do
        ln -sf pipewire-0.3/pulse/$lib.so.0 "$pkgdir/usr/lib/$lib.so.0.999.0"
    done
}


package_pipewire-jack-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for JACK"
    provides=("jack2")
    depends=("pipewire-jack")
    install -dm755 "$pkgdir/usr/lib"
    for lib in libjack libjacknet libjackserver; do
        ln -sf pipewire-0.3/jack/$lib.so.0 "$pkgdir/usr/lib/$lib.so.0.999.0"
    done
}
