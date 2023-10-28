# HurricanePootis <hurricanepootis@protonmail.com>

pkgname="mkdocs-glightbox"
pkgver=0.3.4
pkgrel=1
pkgdesc="A MkDocs plugin supports image lightbox (zoom effect) with GLightbox."
url="https://github.com/Blueswen/mkdocs-glightbox"
license=("MIT")
arch=("any")
depends=("mkdocs")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27e11d6525046f319cec56967eca39456afa24c81e9d0b49cc74c21e6d63bbc3')
options=("!strip")

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
