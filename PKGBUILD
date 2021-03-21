# Maintainer: Alexey Peschany <nelex111@gmail.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>

pkgname=woeusb
pkgver=5.1.0
pkgrel=1
pkgdesc='A Linux program to create Windows USB stick installer from a Windows DVD or an image'
arch=('any')
url='https://github.com/WoeUSB/WoeUSB'
license=('GPL3')
depends=('dosfstools' 'grub' 'ntfs-3g' 'parted' 'wget' 'wimlib')
provides=('woeusb')
source=("https://github.com/WoeUSB/WoeUSB/releases/download/v${pkgver}/woeusb-${pkgver}.bash")
md5sums=(e87d885b326f18780da4f22900fc2461)

prepare() {
  chmod +x woeusb-$pkgver.bash
  mv woeusb-$pkgver.bash woeusb
}

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/woeusb"
}
