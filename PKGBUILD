# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.11.0
pkgrel=1
pkgdesc='Python API and CLI for the IKEA IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-poetry')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3a9971ff1e093fd7dc4dedbe1841a72c17139761c03482d4729a824e58683ed3ced4f7a92e349f81c431d87343b80d76dff3c62d3feaa2fbb81b6e9048830358')

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
