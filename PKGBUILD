# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=1.12.2
pkgrel=2
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/$pkgname"
license=('GPL3')
depends=('dbus-glib'
         'frei0r-plugins'
         'gmic'
         'gtk3'
         'librsvg'
         'mlt-git'
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
sha256sums=('c59bbcebf09102d7dfcfb99509ac9d197e29263fcda9ac9673e60cb38c2ccd3c')

package() {
  cd $pkgname-$pkgver/$pkgname-trunk
  python2 setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
