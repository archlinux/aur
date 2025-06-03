pkgname='termtrack'
pkgver=0.7.4
pkgrel=1
pkgdesc='Track satellites in your terminal'
arch=('any')
url='https://github.com/trehn/termtrack'
license=('GPL3')
depends=('python-click' 'python-pillow' 'python-pyephem' 'python-pyshp' 'python-requests')
makedepends=('python-setuptools' 'python-wheel')

source=()
sha256sums=()

build() {
  # build wheel in src
  python -m build --wheel --no-isolation -C src
}

package() {
  python -m pip install --root="$pkgdir" --prefix=/ ./dist/termtrack-0.7.4-py3-none-any.whl
}

