# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=python-translate
pkgver=3.8.0
pkgrel=1
pkgdesc="Translate is a simple but powerful translation tool written in python with support for multiple translation providers."
url="https://github.com/terryyin/translate-python"
depends=('python' 'python-click' 'python-libretranslate' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
license=('MIT')
arch=('any')
source=(${pkgname}::"https://github.com/terryyin/translate-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0af987a33e9dfbdd99060768e62d2e1961173442abe6baff1676fe46e442c128')


build() {
    cd "${srcdir}/translate-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/translate-python-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
