# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=2.0
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
         'sdl_image'
         'sox'
         'swh-plugins')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c8f21d76803d9ed44585e6d960b12ba1930661e58ee36456fc424d41e2945b33')

package() {
  cd $pkgname-$pkgver/$pkgname-trunk
  python2 setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
