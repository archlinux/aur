# Maintainer: Alexey Makhmutov <makhmutov at gmail dot com>
pkgname=gnome-shell-extension-frippery-move-clock
pkgver=48.1
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
        "frippery-move-clock-gnome49.patch")
b2sums=("e32cf8404e72955cceed54aa9cc9544adffeaea29eb633b678c119386fad9603768b778ca8a26ae27b08b743d9e7ec04421b297e55c168f9236525f6c393b133"
        "e38ac72f27c63c7423e5238d9157f1b70b8c801e49e2cc1494c7bae304797aca17f186f3cf52021b6154501bf43a75a54e70876298ce0a5ae453ae36c8a69e2a"
       )

_uuid="Move_Clock@rmy.pobox.com"

prepare() {
  cd .local
  patch -Np1 -i ../frippery-move-clock-gnome49.patch
}

package() {
  cd .local
  install -D -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" share/gnome-shell/extensions/${_uuid}/extension.js share/gnome-shell/extensions/${_uuid}/metadata.json
}
