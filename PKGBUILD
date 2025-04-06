#Contributor: Carlos Franke <carlos_franke at carlosfranke dot net>
#Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-bdflib
pkgver=2.1.0
pkgrel=1
pkgdesc="Library for working with BDF font files"
url="https://gitlab.com/Screwtapello/bdflib"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/bdflib-v$pkgver.tar.gz")
sha256sums=('31b3e5e45adb66cbe83fa6ec16bb70e125afea3e5d2f919db76109acbfe3bebd')

build() {
  cd "bdflib-v$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "bdflib-v$pkgver"
  python -m unittest -v
}

package() {
  cd "bdflib-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

