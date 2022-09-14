# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.5.1
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-repeat')
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz.tar.gz")
sha512sums=('6d9172626b10557f709c710c432fefc27d6b1c56af46130e5a9473565bff9558cadb704debc010bc3ea40e44447a0a7c7c6fcef5da69ae5fabd4daf3a7ebb382')

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
