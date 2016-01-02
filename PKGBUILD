# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname='cpy'
pkgver=0.3.0
pkgrel=1
pkgdesc="A replacement for [c]at with automatic syntax highlighting"
arch=('any')
url="https://github.com/rumpelsepp/c.py"
license=('MIT')
depends=('python' 'python-pygments')
makedepends=('git' 'asciidoc')
source=("$pkgname::git+https://github.com/rumpelsepp/c.py.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    a2x -f manpage c.1.txt
    a2x -f manpage c.py.1.txt
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man1"
    install -m 644 c.1 "${pkgdir}/usr/share/man/man1/c.1"
    install -m 644 c.py.1 "${pkgdir}/usr/share/man/man1/c.py.1"
    install -m 755 c "${pkgdir}/usr/bin/c"
    install -m 755 c.py "${pkgdir}/usr/bin/c.py"
}
