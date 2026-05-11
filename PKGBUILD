# Maintainer: Will Handley <williamjameshandley@gmail.com>

pkgname=python-conformer
_pkgname=conformer
pkgver=0.3.2
pkgrel=1
pkgdesc='Conformer: Convolution-augmented Transformer (lucidrains)'
arch=('any')
url='https://github.com/lucidrains/conformer'
license=('MIT')
depends=(
  'python'
  'python-pytorch-opt-cuda'
  'python-einops'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/c0/b2/2859d16fe377f1a5dbd3ba85c68fa0e6deb5605ce86faded85b047f8cbed/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('32ef34fa461ff32e1c33061025c0f583884f19d2f0aba200234f4e771f777eda')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
