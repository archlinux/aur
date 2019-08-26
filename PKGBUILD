# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=2.2
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
         'mlt-python2-bindings'
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
sha256sums=('4c7bc61d2d38dbf91bbae9f835fbf82504a47d973983427264706a0596573e70')

package() {
  cd $pkgname-$pkgver/$pkgname-trunk
  python2 setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
