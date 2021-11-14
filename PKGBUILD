# Maintainer: Alexey Peschany <nelex111@gmail.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>

pkgname=woeusb
pkgver=5.2.2
pkgrel=1
pkgdesc='A Linux program to create Windows USB stick installer from a Windows DVD or an image'
arch=('any')
url='https://github.com/WoeUSB/WoeUSB'
license=('GPL3')
depends=('dosfstools' 'grub' 'ntfs-3g' 'parted' 'wget' 'wimlib')
provides=('woeusb')
source=("https://github.com/WoeUSB/WoeUSB/releases/download/v${pkgver}/woeusb-${pkgver}.bash")
sha256sums=(90cd6ae531419b8ed07ed50ba42ec30c9e66f5e48a41e675f271809797499a2f)

prepare() {
  chmod +x woeusb-$pkgver.bash
  mv woeusb-$pkgver.bash woeusb
}

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/woeusb"
}
