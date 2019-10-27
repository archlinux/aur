# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prewikka
pkgver=5.1.1
pkgrel=1
pkgdesc="Graphical front-end analysis console for the Prelude Framework"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('python3' 'python-mako' 'python-yaml' 'python-werkzeug' 'python-babel' 'python-dateutil' 'python-pytz' 'xorg-fonts-type1' 'libprelude' 'libpreludedb' 'python-lark' 'python-croniter' 'python-voluptuous' 'python-gevent')
makedepends=('python-setuptools' 'python-lesscpy' 'gettext')
source=("https://www.prelude-siem.org/pkg/src/5.1.0/$pkgname-$pkgver.tar.gz")
backup=('etc/prewikka/prewikka.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python3 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
}

md5sums=('aa5f3621ec027211f8e4bb4474821562')
