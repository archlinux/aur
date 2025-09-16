# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.13.1
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2f8cd3a05b8b118a7a56c713ae54d8b2d9fa991f58a572bee4bfd596c1c6e2aa10faec4d4ec886fd754a500ae95e1da18dc864f578b1939f4707f3294ae6de98')
b2sums=('980eebb6ad7bfcc1724cb6d71cace1072d5f5e9f233c876da37a07b56b9dba78325dbbe3852acaa8b80f597623b43a632f469e902117bbd6d824d3789a2fbe84')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

