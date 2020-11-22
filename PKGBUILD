# Maintainer: hexchain <i at hexchain dot org>

pkgbase=pipewire-dropin
pkgname=("pipewire-jack-dropin")
pkgver=3
pkgrel=1
pkgdesc="Use pipewire as drop-in replacement for PulseAudio/JACK"
license=("LGPL2.1")
arch=(any)
source=(pipewire-jack.conf pipewire-dropin.install)
install=pipewire-dropin.install

package_pipewire-jack-dropin() {
    pkgdesc="Use pipewire as drop-in replacement for JACK"
    provides=(libjack{,net,server}.so)
    depends=("pipewire-jack")

    install -Dm644 "$srcdir/pipewire-jack.conf" -t "$pkgdir/etc/ld.so.conf.d"
}
sha256sums=('a3e7f6fb87019c1651243bd488e962a49c8e2e6916052c625a85e9a3e9762b8f'
            '1da4554e2c39c78aa4f8bd318b7ef3ff83979034be0b509891894f99bc7ecead')
