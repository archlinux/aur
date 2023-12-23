# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.10.3
pkgrel=1
pkgdesc='Python API and CLI for the IKEA IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-poetry')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('74887a3546d7e5a693fa627937b31bcf32d24faedd045843a526ddbdc11e275b237687a18bf937d2c814b03fbd3a5ba54d099c1d173ce050ded12b72eb528269')

build(){
  cd "${srcdir}/$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

# check(){
    # cd "${srcdir}/$pkgname-$pkgver"

    # pytest
# }

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
