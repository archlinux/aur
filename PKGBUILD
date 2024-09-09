# HurricanePootis <hurricanepootis@protonmail.com>

pkgname="mkdocs-glightbox"
pkgver=0.4.0
pkgrel=1
pkgdesc="A MkDocs plugin supports image lightbox (zoom effect) with GLightbox."
url="https://github.com/Blueswen/mkdocs-glightbox"
license=("MIT")
arch=("any")
depends=("python" "mkdocs")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('876ed99a664144e60c6f3abad9278b43ab972be3956f208f5faf132cd5b0fb5c')
options=("!strip")

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
