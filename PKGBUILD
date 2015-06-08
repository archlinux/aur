# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 

pkgname=i3pystatus-git
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=3.1.r175.g7c82053
pkgrel=1
conflicts=('i3pystatus')
provides=('i3pystatus')
arch=('i686' 'x86_64')
license=('mit')
depends=('python')
optdepends=(
    'python-netifaces: network'
    'python-colour: network'
    'basiciw-git: wireless network'
    'python-dbus: now-playing, thunderbird'
    'python-gobject: thunderbird'
    'python-gobject2: thunderbird'
    'python-beautifulsoup4: parcel'
    'python-cssselect: parcel',
    'python-lxml: parcel',
    'python-pywapi: weather'
    'python-pyalsaaudio: ALSA'
    'python-psutil: memory') 
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
  :
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 
