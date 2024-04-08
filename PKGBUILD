# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.7.0
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-repeat')
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz.tar.gz")
sha512sums=('09e9065598d46e169957d93930538576f0cebc4250d7d0c3fe9ca3b20d05571e030f4882e0687e60950ce7f906a861bce3ae72e7a50f9a5ad0703e2441219b75')

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
