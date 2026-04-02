# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>

_name=accuralai
pkgname=python-accuralai-discord
pkgver=0.2.1
pkgrel=1
pkgdesc="AI-powered Discord bot package using pypresence"
arch=('any')
url="https://pypi.org/project/accuralai/"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-pypresence')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d9e29ac526960cc4fafa9d54c2a9a7f7835aacece4e44e91301af3428080f3a7')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
