# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-spec-config
pkgver=0.1.0
pkgrel=1
pkgdesc="The common shared interfaces for the ABX ArchiveBox plugin ecosystem."
arch=('any')
url="https://pypi.org/project/abx-spec-config"
license=('MIT')
depends=('python' 'python-abx' 'python-benedict' 'python-pydantic' 'python-pydantic-core' 'python-pydantic-settings' 'python-rich' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx-spec-config/abx_spec_config-${pkgver}.tar.gz")
md5sums=('e8745bb8d2a4c9c341107de906f0eff8')

build() {
  cd "$srcdir/abx_spec_config-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_spec_config-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
