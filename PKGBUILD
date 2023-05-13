# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=python-pymilter
pkgver=1.0.5
pkgrel=4
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/${pkgname##*-}"
license=('GPL')
depends=('python')
makedepends=('libmilter'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgname##*-}-${pkgver}.tar.gz")
sha512sums=('d6cd291f3be5402d6e4ab824deba940c6500d970b30c8d73b2fb1952eede4ac784033a7ae0b9a7307f18a3bfd52fc3f40fb0a9cce6cb94e724fce5cc3e8eb25e')

build() {
  cd "${pkgname##*-}-${pkgname##*-}-${pkgver}" 
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##*-}-${pkgname##*-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
