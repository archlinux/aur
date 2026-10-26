# HurricanePootis <hurricanepootis@protonmail.com>

pkgname="mkdocs-glightbox"
pkgver=0.5.3
pkgrel=1
pkgdesc="A MkDocs plugin supports image lightbox (zoom effect) with GLightbox."
url="https://github.com/Blueswen/mkdocs-glightbox"
license=("MIT")
arch=("any")
depends=("python" "mkdocs")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-hatchling")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a65d70bdf5933a4e55de856f3150d5cf1ae01297a989c868c8d312a8cf265a9')
options=("!strip")

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
