# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-sphinx-substitution-extensions
pkgver=2025.01.02
pkgrel=1
pkgdesc='Extensions for Sphinx which allow for substitutions'
arch=(any)
url='https://github.com/adamtheturtle/sphinx-substitution-extensions'
license=('Apache-2.0')
depends=('python-sphinx')
makedepends=('python-setuptools' 'python-pip')
_name=${pkgname#python-}
source=("https://github.com/adamtheturtle/${_name}/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('5baae0bb4c049a2e3905040bb6b1ea3f0b984b9e9fe0f0fa917b1bfa9ad1db1c0c85a1ba5e6be272612917aedec36802db9f8c1ad38c34e9672750203ddb3a24')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
