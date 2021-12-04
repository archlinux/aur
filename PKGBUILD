# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.4.2
pkgrel=2
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://github.com/Popkornium18/audiotag"
license=("MIT")
depends=("python-pytaglib" "python-docopt")
makedepends=("python-setuptools")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("76eda2ca9a367357d377056e2506a0b894a005e3caed36ce29c53e0168a0c6ce")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
