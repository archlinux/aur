# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=13.3.1
pkgrel=1
pkgdesc='Detect platforms and group them by family'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python)
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('45d753d715229c6d67235a0b9c09a45df4b0ffbf53f8fbdd30fa4b4276b2918ef36331879da040776bf083255d240c1b235c222722cd752e04327e4db966f2a2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
