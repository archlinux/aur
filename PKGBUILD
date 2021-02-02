#Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-quadpy
pkgver=0.16.5
pkgrel=2
pkgdesc='Numerical integration (quadrature, cubature) in Python'
arch=(any)
license=(GPL)
url="https://github.com/nschloe/quadpy"
depends=()
makedepends=(python-build)
replaces=()
conflicts=(python-quadpy)
provides=(python-quadpy)
source=(
  https://github.com/nschloe/quadpy/archive/v0.16.5.zip
)
sha512sums=(
  62364a260f42d3a000a000a0f96fa215201e8e0b9831209c522d73ecc38418859919bfff894b9b5ce266c54260ffa6a05af875ada9fbc3b71119fba0278835b6
)
md5sums=(
)
validpgpkeys=()

build() {
  cd "$srcdir/${pkgname#"python-"}-$pkgver"
  python -m build --sdist --wheel .
}
package ()
{
  cd "$srcdir/${pkgname#"python-"}-$pkgver"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/${pkgname#"python-"}-$pkgver-py3-none-any.whl
}


# vim: set ts=2 sw=2 et:

