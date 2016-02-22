# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
pkgname=python2-camel
pkgver=v0.1.r11.g8e3abfe
pkgrel=1
pkgdesc='Python serialization module'
arch=(any)
license=(ISC)
url="https://github.com/eevee/camel"
depends=(python2-yaml)
source=(git+https://github.com/eevee/camel.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/camel"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package ()
{
  cd "$srcdir/camel"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

