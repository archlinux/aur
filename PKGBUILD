# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>
pkgname=python-accuralai-discord
pkgver=0.2.1
pkgrel=5
pkgdesc="AI-powered Discord bot package using pypresence"
arch=('any')
url="https://aur.archlinux.org/packages/python-accuralai-discord"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-pypresence')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("accuralai-${pkgver}.tar.gz")
sha256sums=('b3cd21a637883eb7262ef036681def5c092590b2d6b349ad84af9b5c4f27e2c0')

build() {
    cd "$srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
