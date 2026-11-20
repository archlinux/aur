# Maintainer: agony <27015 at riseup dot net>

pkgname=python-zensical-ui
_name=zensical_ui
pkgver=0.0.43
pkgrel=1
pkgdesc='Templates and browser assets for Zensical'
arch=('any')
url='https://github.com/zensical/ui'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e82d161ad797fff833cd045cfa3ddb9be69f276386b78dd5a4dff76dfbd41596')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation --outdir "${srcdir}/wheel"
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "${srcdir}"/wheel/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
