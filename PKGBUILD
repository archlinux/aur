# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('obhud')
pkgver=0.0.1
pkgrel=7
pkgdesc="Script for handling laptop-specific keys in Openbox"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/obhud"
license=('gpl3')
depends=('xorg-xbacklight' 'xorg-xrandr' 'libxrandr' 'alsa-utils' 'python' 'python-pmw' 'python-pillow' 'python-psutil')
source=("https://github.com/nwg-piotr/obhud/raw/master/dist/obhud-0.0.1.tar.gz"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud")

md5sums=('614fdf95147cb7b3c15cd87fa3e85e65'
         '5b26cb8e7fff160d1eccc183e8ae2d28')

package() {
  install -D -m 755 obhud \
 	 "$pkgdir"/usr/bin/obhud
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
