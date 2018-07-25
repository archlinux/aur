# Maintainer: Tharre <tharre3@gmail.com>

pkgname=grokmirror
pkgver=1.1.0
pkgrel=2
pkgdesc='Framework to smartly mirror git repositories'
url='https://github.com/mricon/grokmirror'
arch=('any')
license=('GPL3')
depends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/mricon/grokmirror/archive/v${pkgver}.tar.gz")
sha256sums=('c838df4e9f055b269dd9664c554586d05cc91db337f559b3c2318aba24c89354')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "man/"*.1
}
