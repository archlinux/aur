# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.1.16
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-repeat')
source=("https://github.com/vxgmichel/aioconsole/archive/v$pkgver/$pkgname-$pkgver.tar.gz.tar.gz")
sha512sums=('98ac3493b474008ca687aae76bfa45876e65ffdee14b4551ff2579dc92b128d8f138ea7415bcbe333b18bf8e2d245d8c36f668cc372725b245af42a1c0d76610')

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
