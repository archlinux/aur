# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pytimechart-git
pkgver=r142.f8fb8cc
pkgrel=1
pkgdesc='a tool to display ftrace (or perf) traces'
arch=(any)
license=(LGPL2.1)
url='https://github.com/tardyp/pytimechart'
depends=(python2 python2-chaco python2-etsproxy)
makedepends=(python2-setuptools)
source=(git://github.com/tardyp/pytimechart.git)
sha1sums=('SKIP')

pkgver() {
  cd pytimechart
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd pytimechart
  python2 setup.py install --root="$pkgdir" --optimize=1
}
