# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('obhud')
pkgver=0.1.4
pkgrel=3
pkgdesc="Script for handling laptop-specific keys in Openbox"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/obhud"
license=('GPL3')
depends=('xorg-xbacklight' 'xorg-xrandr' 'libxrandr' 'alsa-utils' 'python' 'python-pmw' 'python-pillow' 'python-psutil' 'xf86-input-synaptics' 'python-lxml')
source=("https://github.com/nwg-piotr/obhud/raw/master/dist/obhud-0.1.4.tar.gz"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud.conf")

md5sums=('e5c11c24b06177718c509bdb79405669'
         '5b26cb8e7fff160d1eccc183e8ae2d28'
         '4429cf48928bf71e761df0f9b7dcbd8a')

package() {
  install -D -m 755 obhud \
 	 "$pkgdir"/usr/bin/obhud
  install -D -m 644 obhud.conf \
 	 "$pkgdir"/etc/obhud/obhud.conf
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
