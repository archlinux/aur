# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=2.4.0.1
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
         'movit'
         'pygobject-devel'
         'python-dbus'
         'python-gobject'
         'python-mlt'
         'python-numpy'
         'python-pillow'
         'sdl_image'
         'sox'
         'swh-plugins')
# source=("$url/archive/v$pkgver.tar.gz")
source=("$url/archive/v$pkgver-fix_release.tar.gz")
sha256sums=('856fe9fc7cc2d39dd239057b3411a29c947a6ab79e98b8fa8760c3da1e5838f6')

package() {
  # cd $pkgname-$pkgver/$pkgname-trunk
  cd $pkgname-$pkgver-fix_release/$pkgname-trunk
  python setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
