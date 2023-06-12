# Maintainer: Luc Khai Hai <lkh42t@gmail.com>
# Contributer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>

pkgname=python-lsp-isort
_name=${pkgname}
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="isort plugin for the Python LSP Server"
arch=(any)
url="https://github.com/chantera/python-lsp-isort"
license=('MIT')
depends=(python python-lsp-server python-isort)
makedepends=(python-build python-installer python-setuptools python-wheel)
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f02948bc8e7549905032100e772f03464f7548afa96f07d744ff1f93cc58339a')

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
