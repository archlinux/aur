# Maintainer: hexchain <i at hexchain dot org>

pkgbase=pipewire-dropin
pkgname=("pipewire-pulse-dropin" "pipewire-jack-dropin")
pkgver=1
pkgrel=1
pkgdesc="Use pipewire as drop-in replacement for PulseAudio/JACK"
license=("LGPL2.1")
arch=(any)
source=(pipewire-pulse.conf pipewire-jack.conf)

package_pipewire-pulse-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for PulseAudio"
    provides=(libpulse{,-simple,-mainloop-glib}.so)
    depends=("pipewire-pulse")

    install -Dm755 "$srcdir/pipewire-pulse.conf" -t "$pkgdir/etc/ld.so.conf.d"
}


package_pipewire-jack-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for JACK"
    provides=(libjack{,net,server}.so)
    depends=("pipewire-jack")

    install -Dm755 "$srcdir/pipewire-jack.conf" -t "$pkgdir/etc/ld.so.conf.d"
}
sha256sums=('750c8f53b47b39a7bb8bdb62b1f35d749391a6735e4ed88083abb7d2e77a2fcf'
            'a3e7f6fb87019c1651243bd488e962a49c8e2e6916052c625a85e9a3e9762b8f')
