# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.4.3
pkgrel=2
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://github.com/Popkornium18/audiotag"
license=("MIT")
depends=("python-pytaglib")
makedepends=("python-setuptools")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("11072b566ea137acb79220a9bb03a4ea6892da2a1c953d51d813360c9dac172c")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
