# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=robotframework
pkgver=7.4.2
pkgrel=1
pkgdesc="A keyword-driven test automation framework"
arch=('any')
url="http://www.robotframework.org"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9b897a2bf4c94840f87d9832f70e63c8797b6fec061ba441b418f1ce86304861a9806247f9da6a92ab0277314125396313d2cf7e435190866675ddf4353d17f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
