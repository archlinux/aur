# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('obhud')
pkgver=0.1.0
pkgrel=1
pkgdesc="Script for handling laptop-specific keys in Openbox"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/obhud"
license=('GPL3')
depends=('xorg-xbacklight' 'xorg-xrandr' 'libxrandr' 'alsa-utils' 'python' 'python-pmw' 'python-pillow' 'python-psutil')
source=("https://github.com/nwg-piotr/obhud/raw/master/dist/obhud-0.1.0.tar.gz"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud.conf")

md5sums=('37f21dc474fd0c0002e3a3bfd1eaf0da'
         '5b26cb8e7fff160d1eccc183e8ae2d28'
         '943101fced79c8986debb8bb5406e370')

package() {
  install -D -m 755 obhud \
 	 "$pkgdir"/usr/bin/obhud
  install -D -m 644 obhud.conf \
 	 "$pkgdir"/etc/obhud/obhud.conf
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
