# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>
pkgname=python-accuralai-discord
pkgver=0.2.1
pkgrel=4
pkgdesc="AI-powered Discord bot package using pypresence"
arch=('any')
url="https://aur.archlinux.org/packages/python-accuralai-discord"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-pypresence')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("accuralai-${pkgver}.tar.gz")
sha256sums=('b7722c4c103d29464d98f92d7c88d46947e4a317266f9a6932bf2a078d54dbc0')

build() {
    cd "$srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
