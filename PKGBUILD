# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=python-apertium-streamparser
pkgver=5.0.2
pkgrel=1
pkgdesc="Python library to parse the Apertium stream format"
url="https://www.apertium.org/"
license=(GPL3)
arch=(any)
depends=(
        python
        )
makedepends=(
            python-build
            python-installer
            python-setuptools
            python-wheel
            )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/streamparser/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91c4f85c37fe83da7e696c350b6a3a5f57b5af0a4523dc9de5ca159ff24c7122')

build() {
  cd streamparser-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd streamparser-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
