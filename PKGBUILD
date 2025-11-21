# Maintainer: Robert L Box <robertbox514@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=cfv
pkgver=3.2.0
pkgrel=2
pkgdesc='An utility to both test and create checksum files'
arch=('any')
url='https://github.com/cfv-project/cfv'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha512sums=('30b2d310c95335a25cc174ec2a2efd102c8cc53d93a083a64d6eca26bf17214b1622fd2565514414e2edfbfe12de9efe5ca423669ce06c2f4f69ca75d95cd32c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl 
}

# vim:set ts=2 sw=2 et:
