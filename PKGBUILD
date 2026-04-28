# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=12.0.2
pkgrel=1
pkgdesc='Detect platforms and group them by family'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python)
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('516f908d21cb6f760a99d41c2ffafcecb0253d32bdcd55f5aa6915090e34826fdb8f0e3efa2b4ea8d288ffe5c54132087c3cc6ac527b565108630ad27610fa62')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
