# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-odoo-bikeshop"
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="An Odoo 18 plugin for managing a bicycle shop."
arch=('any')
url="https://apps.odoo.com/apps/modules/18.0/bikeshop"
license=('GPL-3.0-only')
depends=('odoo')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/atlbikeshed/${_name}/archive/v$pkgver.tar.gz")
sha256sums=('3be558f53a563583267959a3f73de907931ab355c203cedef2021e99be545574')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
