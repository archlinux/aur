# Maintainer: dreamscache.d <dreamscache.d@gmail.com>
_pkgname=chared
pkgname="python-$_pkgname"
pkgver=2.1
pkgrel=1
pkgdesc="Chared is a tool for detecting the character encoding of a text in a known language."
arch=("any")
url="https://corpus.tools/wiki/Chared"
license=("BSD")
depends=("python" "python-lxml")
makedepends=("python-build" "python-installer")
provides=("$_pkgname")
source=("http://corpus.tools/raw-attachment/wiki/Downloads/$_pkgname-$pkgver.tar.gz")
sha256sums=("686c6fbae5e1731a78d6480e19cee589ec9242fe80b3c7f2db60053352046670")

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}