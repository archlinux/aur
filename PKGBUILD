# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python-camel-git
pkgver=v0.1.r13.g13b7a26
pkgrel=2
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python-yaml)
conflicts=('python2-camel')
provides=('python2-camel')
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
