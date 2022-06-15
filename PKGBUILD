# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-scrap_engine
pkgver=1.2.0
pkgrel=1
pkgdesc="A 2D ascii game engine for the terminal"
arch=('any')
url="https://pypi.org/project/scrap-engine"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-scm')
source=("$pkgname::git+https://github.com/lxgr-linux/scrap_engine.git#tag=$pkgver")
sha256sums=('SKIP')
b2sums=('SKIP')

build() {
  cd "$pkgname"

  python setup.py build
}

check() {
  cd "$pkgname"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
