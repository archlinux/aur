# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=doujinshi-dl
pkgver=2.0.9
pkgrel=1
pkgdesc='Doujinshi downloader framework'
arch=(any)
url="https://github.com/RicterZ/doujinshi-dl"
license=('MIT')

depends=(
    python-requests
    python-soupsieve
    python-beautifulsoup4
    python-tabulate
    python-iso8601
    python-httpx
    python-pip
    python-chardet
    doujinshi-dl-nhentai
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-poetry
)

conflicts=(nhentai-git)
source=("https://github.com/RicterZ/doujinshi-dl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c727feaf371f0166f13701126a22b2c715964fd15ca3037e29647a095b74e34a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
