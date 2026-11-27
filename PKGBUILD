# Maintainer: agony <27015 at riseup dot net>

pkgname=python-zensical-ui
_name=zensical_ui
pkgver=0.0.44
pkgrel=1
pkgdesc='Templates and browser assets for Zensical'
arch=('any')
url='https://github.com/zensical/ui'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7c47d4f02b5ac6aedbd0ea0b9591012e13519448df75d5e009af2ea0e60567f2')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation --outdir "${srcdir}/wheel"
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "${srcdir}"/wheel/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
