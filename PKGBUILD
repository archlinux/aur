# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=47.0
pkgrel=1
pkgdesc="GNOME extension that moves the clock from the centre of the panel towards the right. Part of GNOME Shell Frippery."
arch=("any")
url='http://frippery.org/extensions/index.html'
license=("GPL-2.0-or-later")
groups=("gnome-shell-extensions")
depends=("gnome-shell>=1:46")
conflicts=("gnome-shell-frippery")
options=("!strip" "!debug")
source=("http://frippery.org/extensions/gnome-shell-frippery-${pkgver}.tgz"
        "frippery-move-clock-gnome48.patch")
b2sums=("2348110028d35d882bdb54a748524f4c84c19a4d110d918edd8fc8f0c51988cbc87d5f5590a7896edc21e481ac5731a114642987cf8841e5b196d992ef063337"
        "1eb49d22f0f13e66507010278c13f81746e3b328070bb1c7fad835dac0882c37ad9ebdbddeae9d52fce5f670438116de91fcbba8cf927ba766aeab7755412139")

_uuid="Move_Clock@rmy.pobox.com"

prepare() {
  cd .local
  patch -Np1 -i ../frippery-move-clock-gnome48.patch
}

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
