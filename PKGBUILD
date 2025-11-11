# Contributor:

pkgname=python-cachier
_pkgname=cachier
pkgver=4.1.0
pkgrel=1
pkgdesc="Persistent, stale-free, local and cross-machine caching for Python functions."
arch=('any')
url="https://github.com/python-cachier/cachier"
license=('MIT')
depends=('python' 'python-portalocker' 'python-watchdog' 'python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('83fbc941829f66068d83ba1ecd0d5406a65bd67bb623a0c2a0cf926dc36508b4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl 
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
