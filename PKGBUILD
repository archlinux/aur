# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.8.1
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-uvloop'
)
checkdepends=(
	'python-pytest-asyncio'
	'python-pytest-repeat'
)
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7c17aa1110f9f04ac681142972e3561d7046e81f6d1100b1da403f3f18b2c4dcfb70cff54c99e1a77ceb5d82e3320ec37108e0c729008d422bb38f927ca73146')

build() {
  cd aioconsole-$pkgver
  python setup.py build
}

check() {
  cd aioconsole-$pkgver
  python -m pytest -o addopts=''
}

package() {
  cd aioconsole-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
