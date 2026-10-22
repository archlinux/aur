# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: Amir Shygun <a-shygun@users.noreply.github.com>
pkgname=terrascope
pkgver=0.3.0
pkgrel=1
pkgdesc="Braille-rendered terminal world map with live weather and aircraft"
arch=('any')
url="https://github.com/a-shygun/terrascope"
license=('MIT')
depends=('python>=3.10' 'python-numpy' 'python-pillow' 'python-yaml' 'python-pyshp')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a-shygun/Terrascope/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ff0a052e6a122972554ce29e8eac09dc5a64fe696676f0691a8209d32d7c1c9')

build() {
  cd "$srcdir/Terrascope-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/Terrascope-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
