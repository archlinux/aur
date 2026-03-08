# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-pylint-odoo"
_name=${pkgname#python-}
pkgver=10.0.1
pkgrel=1
pkgdesc="Plugin for pylint that adds special lints for Odoo modules."
arch=('any')
url='https://pypi.org/project/pylint-odoo/'
license=('AGPL-3.0-only')
depends=(
    'python'
    'python-pylint'
    'python-pylint-plugin-utils'
    'python-validators')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/OCA/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df3529002825eab57c01c1ddd857c30cbd7d496d6c989823610058a53b3223af')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
