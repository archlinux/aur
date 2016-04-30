# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prewikka
pkgver=3.0.0
pkgrel=1
pkgdesc="Graphical front-end analysis console for the Prelude Framework"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
depends=('python2' 'python2-cheetah' 'python2-babel' 'python2-dateutil' 'python2-pytz' 'xorg-fonts-type1' 'libprelude' 'libpreludedb')
makedepends=('python2-setuptools' 'python2-lesscpy' 'gettext')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz")
backup=('etc/prewikka/prewikka.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  rm -rf $pkgdir/var/run
}

md5sums=('a0827a7740061830ac639e7d5d86f5a9')
