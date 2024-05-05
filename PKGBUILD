# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.4.3
pkgrel=1
pkgdesc='parsing the command line the easy way'
arch=(any)
url="https://github.com/ialbert/plac"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('32e2d88bc580c6f886982bd673142e34e2203d3eabdb828d84397e842e4fa00a2bb1e02c73134f58c3a5d8edb83496ccd6a7f7791b6a16c494d44c90dced69b0')

build() {
    cd "plac-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "plac-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}

# vim: set ts=4 sw=4 et:
