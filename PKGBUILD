# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org> 

pkgname=i3pystatus-git
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=3.35.r370.gac71437
pkgrel=1
conflicts=('i3pystatus')
provides=('i3pystatus')
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
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
makedepends=('git' 'python-setuptools')
url="https://github.com/enkore/i3pystatus.git"
source=('git+https://github.com/enkore/i3pystatus.git')
_gitname="i3pystatus"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
} 
