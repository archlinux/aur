# Maintainer: Sebastien Bariteau <numkem@gmail.com>

pkgname=i3pystatus
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=3.34
pkgrel=1
arch=('i686' 'x86_64')
license=('mit')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyalsaaudio: For the alsa module.',
            'python-dbus: For the thunderbird or now_playing modules.',
            'python-psutil: For the mem, membar or network_traffic modules.',
            'python-netifaces: For the network or wireless modules.',
            'python-beautifulsoup4: For the parcel module.',
            'python-cssselect: For the parcel module.',
            'python-lxml: For the parcel module.',
            'python-pywapi: For the weather module.',
            'python-basiciw: For the wireless module.'
            'python-colour: For the pulseaudio module.')
url="https://github.com/enkore/i3pystatus"
source=("https://github.com/enkore/i3pystatus/archive/$pkgver.tar.gz")
md5sums=('5f87c2b230c8085e667fa18f6af64b06')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 
