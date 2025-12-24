# Maintainer: Robert L Box <robertbox514@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=cfv
pkgver=3.2.0
pkgrel=1
pkgdesc='An utility to both test and create checksum files'
arch=('any')
url='https://github.com/cfv-project/cfv'
license=('GPL-2.0-or-later' 'MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cfv/cfv-$pkgver.tar.gz")
sha256sums=('090d453fc9beeb9cf37ae8edf7ebae3d9686ac9382d4bea5df9191b429e6403c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
