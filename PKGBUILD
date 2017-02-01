# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>

pkgname=python2-libpebble2-git
pkgver=v0.0.27
pkgrel=1
pkgdesc="The library portion of the successor to libpebble, a python library for interacting with Pebble devices."
arch=('i386' 'x86_64')
license=('MIT')
url="https://github.com/pebble/libpebble2"
depends=('python2'
         'python2-six'
         'python2-websocket-client'
         'python2-wsgiref'
         'python2-backports.ssl_match_hostname')
makedepends=('python2-setuptools')
provides=("python2-libpebble2")
conflicts=("python2-libpebble2")
options=(!emptydirs)
source=('git+https://github.com/pebble/libpebble2.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libpebble2"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$srcdir/libpebble2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
