# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-translate
pkgver=3.6.1
pkgrel=2
pkgdesc="Translate is a simple but powerful translation tool written in python with support for multiple translation providers."
url="https://github.com/terryyin/translate-python"
depends=('python' 'python-libretranslate')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
license=('MIT')
arch=('any')
source=(${pkgname}::"https://github.com/terryyin/translate-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('28ddafe090847031a46f626fd06a2adaff067ff9f7c15234e05b196c9393f7f1')


build() {
    cd "${srcdir}/translate-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/translate-python-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
