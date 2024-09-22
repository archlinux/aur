# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.4.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a073bb9ce11e6ba23399d72f7f4d58cbcc51be97c7f7cb24ba45fd42c38433886fd5d6882e1dd6206602b886a713c3ecf8422f8ebe8d27e9ffac1877c7b62aff')
b2sums=('cfb9acc8554c01e94405bbaf33600d96f367eacbc0eeac231b0df858c062f23a26b0434fc6c1f0d56d2faebdcafdcb7b862b05a3973284d8e330ce298eb9ff2b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

