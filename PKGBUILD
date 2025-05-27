# Maintainer: Luc Khai Hai <lkh42t@gmail.com>
# Contributer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>

pkgname=python-lsp-isort
_name=${pkgname//-/_}
pkgver=0.2.1
pkgrel=1
epoch=1
pkgdesc="isort plugin for the Python LSP Server"
arch=(any)
url="https://github.com/chantera/python-lsp-isort"
license=('MIT')
depends=(python python-lsp-server python-isort)
makedepends=(python-build python-installer python-hatchling)
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2f37af3c63132916a40377c323897d743546470a75e78b096fc88fcae997525b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vi: sts=2 sw=2 et
