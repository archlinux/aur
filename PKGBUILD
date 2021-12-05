# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.4.4
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://github.com/Popkornium18/audiotag"
license=("MIT")
depends=("python-pytaglib")
makedepends=("python-setuptools")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a58ac3c18d5415602682d12d1d247e8aefa2a2905fb665e0e50f46308e68f431")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
