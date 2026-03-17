# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.24.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('97272d24fe19c1dba2f05e3254d96926084d10a32dd81a76b3ce5bb96144770378f0d508703d5a122c0ea32f90a7e6c01388845ecca0c8fabdfa4e13ff2432a5')
b2sums=('e69a2dcc60289a5347ae5ddb1fcc473366924f9ee46afd71c121da1f1a86dad404e40a393f964e43d4b6715fbcfcc3fab16e1e4460c427f1a2ac0e58b9443744')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

