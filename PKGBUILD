# Contributor:

pkgname=python-cache_to_disk
_pkgname=cache_to_disk
pkgver=2.0.0
pkgrel=1
pkgdesc="Local disk caching decorator for python functions."
arch=('any')
url="https://github.com/sarenehan/cache_to_disk"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/22/df/9712d98cadf4dfab259b09ea2972f5585f4a6909d19fe60be2b7adb8823d/cache_to_disk-2.0.0.tar.gz)
sha256sums=('79e19ea9b72eedc5cec83bb8aa55374afc671493e7d13d541f3b63eb3a13fb32')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}

# vim:set ts=2 sw=2 et:
