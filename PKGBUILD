# Maintainer: Ondrej Dohnal <dohnal@douball.eu>

_pkgname=dataclass-wizard
pkgname=python-${_pkgname}-git
pkgver=v0.32.0
pkgrel=3
pkgdesc="This library provides a set of simple, yet elegant wizarding tools for interacting with the Python dataclasses module."
arch=('any')
url="https://github.com/rnag/dataclass-wizard"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+${url}#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
