# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=13.1.0
pkgrel=1
pkgdesc='Detect platforms and group them by family'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python)
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ab1ccbb00027c98696e523896fccf0a7fe88336084cc2df5ca479a778ef005b2aa9bef3c87c5e047443215a485eb6464ffb1e69dff271611827363508fef8318')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
