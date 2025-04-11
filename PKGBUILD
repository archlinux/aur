# Maintainer: a821 <a821 (nospam) mail de>

pkgname=python-session-info
_name=session_info
pkgver=1.0.1
pkgrel=1
pkgdesc="Print version information for loaded modules in the current session, python, and OS"
url="https://gitlab.com/joelostblom/session_info"
arch=('any')
license=('BSD-3-Clause')
depends=('python-stdlib-list') # AUR
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+${url}.git#tag=v$pkgver")
sha256sums=('d4b5aa4d2fefb4631a731ec24b46ef9c020ab59ff500ee938da16cfe63b16d85')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim: set ts=4 sw=4 et:
