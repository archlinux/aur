# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=bluemindo
pkgver=1.0rc1
pkgrel=1
pkgdesc='Ergonomic and modern music player designed for audiophiles'
arch=('any')
url='http://bluemindo.codingteam.net'
license=('GPL3')
depends=('gst-python' 'python-dbus' 'python-beautifulsoup4' 'python-pytaglib')
source=("https://codingteam.net/project/bluemindo/download/file/bluemindo-$pkgver.tar.gz"
        "makefile.patch")
sha256sums=('e405c881feeb43f8126988403e1c1008ee5341c8faae90d5e671d9075c89fe5c'
            '3f8758bd2255966af796937902e1ff5064df3f34283172eaee8b28d855fb0747')

prepare() {
  cd $pkgname-1.0RC1

  patch -p1 -i ../makefile.patch
}

package() {
  cd $pkgname-1.0RC1

  make DESTDIR="$pkgdir" install
}
