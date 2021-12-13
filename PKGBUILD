# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.4.5
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://github.com/Popkornium18/audiotag"
license=("MIT")
depends=("python-pytaglib")
makedepends=("python-setuptools")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4b634016f7a0ae3758069892c9ea57f022323e8216ce75e9e02e28af0700628f")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
