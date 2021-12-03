# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://gitlab.com/Popkornium18/audiotag"
license=("MIT")
depends=("python" "python-setuptools" "python-pytaglib" "python-docopt")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ad14bd515f3827fe2e27ad5851aa637d424b41beaa27a438a61cd279c11c1e32")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
