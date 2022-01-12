# Maintainer: a821 <a821 (nospam) mail de>

pkgname=python-session-info
_name=session_info
pkgver=1.0.0
pkgrel=1
pkgdesc="Print version information for loaded modules in the current session, python, and OS"
url="https://gitlab.com/joelostblom/session_info"
arch=('any')
license=('BSD')
depends=('python-stdlib-list') # AUR
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('3cda5e03cca703f32ae2eadbd6bd80b6c21442cfb60e412c21cb8ad6d5cbb6b7'
            '2f1ea30058f176173ce97c994b87647e816019e0fc4f28d40968c31894ee876e')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim: set ts=4 sw=4 et:
