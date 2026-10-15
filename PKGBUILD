# Maintainer: Sergey Malkin <adresatt@gmail.com>
# Contributor: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-neo
pkgname=('python-neo')
pkgver=0.14.6
pkgrel=1
pkgdesc="Neo is a package for representing electrophysiology data in Python, together with support for reading a wide range of neurophysiology file formats"
arch=('any')
url="https://pypi.org/project/neo/#files"
license=("custom")
depends=("python-quantities")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://github.com/NeuralEnsemble/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cabb806978cf8c96e53fd5bfb49a4ba7a04120049e75e90d145e09a67eebf8d2')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
