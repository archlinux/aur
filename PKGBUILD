# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=robotframework
pkgver=7.0.1
pkgrel=1
pkgdesc="A keyword-driven test automation framework"
arch=('any')
url="http://www.robotframework.org"
license=('Apache-2.0')
depends=('python')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8098c760888a139d17c9ecf3e791a6926cd9f0f6e42e22e07c238273b373827a6aa6c0238346151784a0cfb90f573618904329310c5c9f433f426369dc753427')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
