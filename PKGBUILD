# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

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
  python -m build --wheel --no-isolation
}

package() {
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

