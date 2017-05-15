# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python-camel-git
pkgver=v0.1.1.r0.g6e4b3e3
pkgrel=1
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python-yaml)
conflicts=('python-camel')
provides=('python-camel')
source=(git+https://github.com/eevee/camel.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/camel"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
  cd "$srcdir/camel"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
