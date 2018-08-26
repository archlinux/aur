# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('obhud')
pkgver=0.1.8
pkgrel=3
pkgdesc="Script for handling laptop-specific keys and events in Openbox"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/obhud"
license=('GPL3')
depends=('xorg-xbacklight' 'xorg-xrandr' 'libxrandr' 'alsa-utils' 'python' 'python-pmw'
'python-pillow' 'xf86-input-synaptics' 'ffmpeg' 'python-lxml')
source=("https://github.com/nwg-piotr/obhud/raw/master/dist/obhud-0.1.8.tar.gz"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud.conf"
"https://github.com/nwg-piotr/obhud/raw/master/dist/timer.sh")

md5sums=('6f6dafc0190975a3186d5ed5afd4561e'
         '89995467e1d46692720d5331b8d444ac'
         '4429cf48928bf71e761df0f9b7dcbd8a'
         '709a4a0a8442101f33541a1d69e6570a')

package() {
  install -D -m 755 obhud \
 	 "$pkgdir"/usr/bin/obhud
  install -D -m 644 obhud.conf \
 	 "$pkgdir"/etc/obhud/obhud.conf
  install -D -m 755 timer.sh \
 	 "$pkgdir"/etc/obhud/timer.sh
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

