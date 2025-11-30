pkgname=python-ctkmessagebox
_name=ctkmessagebox
pkgver=2.7
pkgrel=1
pkgdesc="A modern messagebox for CustomTkinter"
arch=('any')
url="https://github.com/Akascape/CTkMessagebox"
license=('CC0-1.0')
depends=(
  'python'
  'python-customtkinter'
  'tk'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz"
)
sha512sums=('SKIP')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
