#Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='python-humblewx'
_module='humblewx'
pkgver='0.2.2'
pkgrel=2
pkgdesc="Library that simplifies creating user interfaces with wxPython."
license=('GPL-3.0-only')
url="https://github.com/thetimelineproj/humblewx"
arch=('any')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/h/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('b327e6c8ed4c278136e0d15f436275f4f07f42f062d023e5ea999e7401bf9177')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
