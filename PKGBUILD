# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=13.7.1
pkgrel=1
pkgdesc='Detect platforms and group them by family'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python)
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6f3bd5aac9c4db3df9cf183ed352ae687ad2235e9f39ae6c6c4108dc804430cd7b0698e9b5f8539ce8db8cd6d7ae325375300a98ba0a778f7dfcf96f46b10d0e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
