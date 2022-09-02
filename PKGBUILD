# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.9.1
pkgrel=2
pkgdesc='Python API and CLI for the ikea IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-poetry')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('635a095ce8017c75891ffe6aa70824bec7771aec311a81e0020e579f1ff24c50c0845f2480b566670db5c78d55cd7fbcd70a6ac1b4329ed40e029f7af577bdb6')

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
