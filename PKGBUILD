# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=12.0.1
pkgrel=1
pkgdesc='Detect platforms and group them by family'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python)
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fe950438664eff0b50ab4cdb130a34fb0a5cf99dbeee8005b18ec531e256873581604a0058d0f1655c99f0207c89e31e89af3a73cf8244e0f5d425e5b61f1227')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
