# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: <stormdragon2976@gmail.com>
# Contributer: Ondrej Kipila <ok100@openmailbox.org>

pkgname=lyvi
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line lyrics, guitar tabs, and artist information viewer"
url="https://ok100.github.io/lyvi/"
arch=(any)
license=('WTFPLv2')
depends=('python-glyr' 'python-pillow' 'python-psutil' 'python-urwid')
optdepends=('python-dbus: mpris support'
            'python-gobject: mpris support')
makedepends=('python-pip')
source=("https://github.com/ok100/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/ok100/${pkgname}/commit/b84176c9c440bd627943e0d25831fa98c2a9c1f7.patch"
        "https://github.com/ok100/${pkgname}/commit/6777afe89ca1f680f1e5f73ac95fe33295a5ce3b.patch"
)
md5sums=('8c85fc43b8f7f225fd4231801762a6bb'
         'eac8d51f7bd209efa7699ed38bd914b5'
         '2d4dd00ecd4f36acdbac8022577873c2'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ${srcdir}/b84176c9c440bd627943e0d25831fa98c2a9c1f7.patch
  patch -p1 -i ${srcdir}/6777afe89ca1f680f1e5f73ac95fe33295a5ce3b.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
