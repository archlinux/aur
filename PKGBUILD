# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('obhud')
pkgver=0.2.0
pkgrel=1
pkgdesc="Script for handling laptop-specific keys and events in Openbox"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/obhud"
license=('GPL3')
depends=('xorg-xbacklight' 'xorg-xrandr' 'libxrandr' 'alsa-utils' 'python' 'python-pmw'
'python-pillow' 'xf86-input-synaptics' 'ffmpeg' 'python-lxml' 'python-setuptools')
source=("https://github.com/nwg-piotr/obhud/raw/master/dist/obhud-0.2.0.tar.gz"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud"
"https://github.com/nwg-piotr/obhud/raw/master/dist/obhud.conf"
"https://github.com/nwg-piotr/obhud/raw/master/dist/timer.sh")

md5sums=('3949336a4c927747cc945557bb4a10a4'
         '89995467e1d46692720d5331b8d444ac'
         '4429cf48928bf71e761df0f9b7dcbd8a'
         '6c9b537c6f32d3047a2b691d8ef600a7')

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
