# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname='cpy'
pkgver=0.2.0
pkgrel=1
pkgdesc="A replacement for [c]at with automatic syntax highlighting"
arch=('any')
url="https://github.com/rumpelsepp/c.py"
license=('MIT')
depends=('python' 'python-click' 'python-docopt' 'python-pygments')
makedepends=('git' 'asciidoc')
source=("$pkgname::git+https://github.com/rumpelsepp/c.py.git#tag=v0.2.0")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    a2x -f manpage c.1.txt
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/man/man1"
    install -m 644 c.py.1 "${pkgdir}/usr/share/man/man1/c.1"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
