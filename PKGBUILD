# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.3.3
pkgrel=2
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-repeat')
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz.tar.gz")
sha512sums=('70ea0cca07711f31e261ec45d96a0901f9cf4d007b3195389a1b81e87054b6cb20429f9bb47faac66022824f412957b68e7fad928c78e65ce18b0e9db822ec94')

build() {
  cd aioconsole-$pkgver
  python setup.py build
}

check() {
  cd aioconsole-$pkgver
  python -m pytest
}

package() {
  cd aioconsole-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
