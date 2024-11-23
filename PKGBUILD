# Maintainer: envolution
# Contributor: Astro Benzene <universebenzene at sina dot com>
pkgname=python-novas_de405
_pyname=${pkgname#python-}
pkgver=1997.1
pkgrel=3
pkgdesc="JPL DE405 ephemeris needed by the NOVAS package"
arch=('i686' 'x86_64')
url="https://github.com/brandon-rhodes/python-novas"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86341c564b5b97ca8693f1b25135efd8')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}
package() {
  cd "${_pyname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README
  python -m installer --destdir="$pkgdir" dist/*.whl
}
