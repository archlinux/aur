# Maintainer: Christopher Snowhill <kode54 at gmail dot com>

pkgbase=lib32-pipewire-dropin
pkgname=("lib32-pipewire-pulse-dropin" "lib32-pipewire-jack-dropin")
pkgver=0.0.1
pkgrel=1
pkgdesc="Use pipewire as drop-in replacement for PulseAudio/JACK (32-bit version)"
license=("LGPL2.1")
arch=(any)

package_lib32-pipewire-pulse-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for PulseAudio (32-bit version)"
    depends=("lib32-pipewire-pulse")

    install -dm755 "$pkgdir/usr/lib32"
    for lib in libpulse-mainloop-glib libpulse-simple libpulse; do
        ln -sf pipewire-0.3/pulse/$lib.so.0 "$pkgdir/usr/lib32/$lib.so.0.999.0"
    done
}


package_lib32-pipewire-jack-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for JACK"
    depends=("lib32-pipewire-jack")
    install -dm755 "$pkgdir/usr/lib32"
    for lib in libjack libjacknet libjackserver; do
        ln -sf pipewire-0.3/jack/$lib.so.0 "$pkgdir/usr/lib32/$lib.so.0.999.0"
    done
}
