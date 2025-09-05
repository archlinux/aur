# HurricanePootis <hurricanepootis@protonmail.com>

pkgname="mkdocs-glightbox"
pkgver=0.5.1
pkgrel=1
pkgdesc="A MkDocs plugin supports image lightbox (zoom effect) with GLightbox."
url="https://github.com/Blueswen/mkdocs-glightbox"
license=("MIT")
arch=("any")
depends=("python" "mkdocs")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-hatchling")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0aa457a47c01445cbd4517d8bf7d18815d68f98ffa08f8ee341146b39baa22b4')
options=("!strip")

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
