# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: PHAM Van Diep <imeo at favadi dot com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=volti
pkgver=0.2.3
pkgrel=5
pkgdesc="GTK+ mixer application for controlling alsa audio volume from system tray"
arch=('any')
url="https://github.com/gen2brain/volti"
license=('GPL3')
depends=('pygtk' 'python2-pyalsaaudio' 'python2-dbus')
optdepends=('python2-xlib: Multimedia keys support')
source=(volti-$pkgver.tar.gz::"https://github.com/gen2brain/volti/archive/$pkgver.tar.gz"
        volti-remove-dbus-version-check.patch)
sha256sums=('b0d614d720510261696401b87452a30a490dc34e1023fa42fbab8b2ef3989ed6'
            'b50851956121fd37af46d3304d58fde58dc8d000b25e11c28d9f17b36591da4b')

prepare() {
  cd volti-$pkgver

  patch -Np1 <../volti-remove-dbus-version-check.patch
}

build() {
  cd volti-$pkgver

  python2 setup.py build
}

package() {
  cd volti-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
}
