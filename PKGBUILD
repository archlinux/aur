# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=11.0.12
pkgrel=2
pkgdesc="Seafile webdav server"
arch=('any')
url="https://github.com/haiwen/seafdav"
license=('MIT')

depends=('python'
         'python-json5'
         'python-seafobj'
         'python-defusedxml'
         'python-jinja'
         'python-sqlalchemy'
         'python-yaml')

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'libyaml')

conflicts=('python-wsgidav')
source=("${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('6d4723f5d5238ae0a847427a8c2c7133c5cc1954280ce8c801651e4211ffe55c')

build() {
  cd "$srcdir/seafdav-$pkgver-server"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/seafdav-$pkgver-server"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
