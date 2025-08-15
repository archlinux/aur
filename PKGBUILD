# Maintainer: Robert L Box <robertbox514@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=cfv
pkgver=3.1.0
pkgrel=1
pkgdesc='An utility to both test and create checksum files'
arch=('any')
url='https://github.com/cfv-project/cfv'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha512sums=('71c02cc0e5cb1dcf32aa180075744ccde27cf08765a6cf50b24bbdf68d61ba46d9e2e98cc9d414bddf1538ead1426f8eff56cfa788ad283981922c96519b10c4')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl 
}

# vim:set ts=2 sw=2 et:
