# HurricanePootis <hurricanepootis@protonmail.com>

pkgname="mkdocs-glightbox"
pkgver=0.3.7
pkgrel=1
pkgdesc="A MkDocs plugin supports image lightbox (zoom effect) with GLightbox."
url="https://github.com/Blueswen/mkdocs-glightbox"
license=("MIT")
arch=("any")
depends=("mkdocs")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fff4f5d885d273ac1d4dd980f7193e8d96a594a37e5d7127deffea1a11f1a3bd')
options=("!strip")

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
