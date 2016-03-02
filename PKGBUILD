# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgbase=pypy-camel
pkgname=(pypy-camel pypy3-camel)
pkgver=v0.1.r12.g7e2c6b7
pkgrel=1
pkgdesc='Python serialization module (build for pypy)'
arch=(any)
license=(ISC)
makedepends=('pypy3' 'pypy' 'pypy3-yaml' 'pypy-yaml')
url="https://github.com/eevee/camel"
depends=(python2-yaml)
source=('git+https://github.com/eevee/camel.git#commit=7e2c6b7bf965c4e9d098d6c56594ca2c36b63aa8')
sha512sums=('SKIP')

package_pypy-camel () {
  depends=('pypy-yaml' 'pypy')

  cd "$srcdir/camel"
  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
}

package_pypy3-camel () {
  depends=('pypy3-yaml' 'pypy3')

  cd "$srcdir/camel"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
}
