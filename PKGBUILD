# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.3.0
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-repeat')
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz.tar.gz")
sha512sums=('60cb0fa7226e1b78c13d4a2c8efec3abd9ff1a64ff1512326029f23f9f8f68709d93d35b06cce4164c367f969a9ea2686acfc2a09d1830079cf61077d07ca5a6')

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
