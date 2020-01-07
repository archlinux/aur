# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=flowblade
pkgver=2.4
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
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('708ec92081d12f1388191fccce69643bf3a30fe6567a0037fb95c8774014472b')

package() {
  cd $pkgname-$pkgver/$pkgname-trunk
  python setup.py install \
    --root=$pkgdir \
    --install-lib=/usr/share/pyshared \
    --optimize=1
}
