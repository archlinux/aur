# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=('any')
url="https://gitlab.com/Popkornium18/audiotag"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pytaglib' 'python-docopt')
source=("https://gitlab.com/Popkornium18/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('88f73443b0834adbcbe6099ebbaa5bc9c0a8e36a3ca347e710e3d5070ca83ddc')

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
