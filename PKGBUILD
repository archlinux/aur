# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=itango
pkgver=0.3.0
pkgrel=1
pkgdesc="An interactive Tango client."
groups=('tango-controls')
arch=('any')
url="https://gitlab.com/tango-controls/itango"
license=('LGPL-3.0-or-later')
depends=('python' 'python-pytango>=9.3' 'ipython>=8.5' 'python-packaging' 'python-traitlets' 'python-ipykernel')
optdepends=('python-qtconsole: for itango-qt GUI console')
conflicts=('itango-git')
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1409cff2814f2945d2848c3c2777e5ed8ae5f45c6f16380abafcb9b5f3fed9d8')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
