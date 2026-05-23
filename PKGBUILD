# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=doujinshi-dl-nhentai
pkgver=1.2.0
pkgrel=1
pkgdesc='nhentai plugin for doujinshi-dl'
arch=(any)
url="https://github.com/RicterZ/doujinshi-dl-nhentai"
license=('MIT')

depends=(
    python-requests
    python-soupsieve
    python-beautifulsoup4
    python-tabulate
    python-iso8601
    python-httpx
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-poetry
)

conflicts=(nhentai-git)
source=("https://github.com/RicterZ/doujinshi-dl-nhentai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ca3817f99b5301a9d92b8917244a37ba1b310dba48c84392921f8df05d91aa0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
