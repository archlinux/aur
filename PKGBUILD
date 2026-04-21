# Maintainer: Sergey Malkin <adresatt@gmail.com>
# Contributor: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-neo
pkgname=('python-neo')
pkgver=0.14.4
pkgrel=1
pkgdesc="Neo is a package for representing electrophysiology data in Python, together with support for reading a wide range of neurophysiology file formats"
arch=('any')
url="https://pypi.org/project/neo/#files"
license=("custom")
depends=("python-quantities")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://github.com/NeuralEnsemble/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('886007792b66f114f6cbfbf85465a01dd8a3467dad3d55756a78c9266cedc09e')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
