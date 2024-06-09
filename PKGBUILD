# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=python-pymilter
pkgver=1.0.6
pkgrel=1
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/${pkgname##*-}"
license=('GPL-2.0-only')
depends=('python')
makedepends=('libmilter'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgname##*-}-${pkgver}.tar.gz")
sha512sums=('e93e09865916c0770a956cf04f4c4db7dd645b5eda5b7f033c7cd3953d91d06f0ee3eaf30ef0cdcf718fe6cbd3c79a4eab582f22c2f90ffeb09f9590d1d482be')

build() {
  cd "${pkgname##*-}-${pkgname##*-}-${pkgver}" 
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##*-}-${pkgname##*-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
