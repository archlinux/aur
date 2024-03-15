# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=adjustor
pkgver=2.0.1
pkgrel=1
pkgdesc='Adjustor, a userspace program for managing the TDP of handheld devices.'
arch=('x86_64')
url='https://github.com/hhd-dev/adjustor'
license=('GPL-3.0-or-later')
depends=('python' 'python-rich' 'python-pyroute2')
provides=('adjustor')
optdepends=('hhd: adds adjustor to the hhd ui.' 'acpi_call: required for setting TDP (may be provided as a kernel patch).')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("https://pypi.python.org/packages/source/a/adjustor/adjustor-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd "adjustor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "adjustor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
