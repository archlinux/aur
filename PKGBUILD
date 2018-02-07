# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=1.14
pkgrel=1
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/$pkgname"
license=('GPL3')
depends=('dbus-glib'
         'frei0r-plugins'
         'gmic'
         'gtk3'
         'librsvg'
         'mlt'
         'mlt-python-bindings'
         'movit'
         'pygtk'
         'python2-dbus'
         'python2-gobject'
         'python2-numpy'
         'python2-pillow'
         'sox'
         'swh-plugins')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6096d6fb67ec8bb4cf422a11282bb8a38fb879ae178a1e54693870ef9ae212bf')

package() {
  cd $pkgname-$pkgver/$pkgname-trunk
  python2 setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
