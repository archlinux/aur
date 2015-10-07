# Maintainer: Michael Greene <mgreene@securityinnovation.com>

pkgname=eluminance-git
pkgver=0.9.r66
pkgrel=1
pkgdesc="A fast photo browser, written in Python using EFL"
arch=('any')
url="https://github.com/DaveMDS/eluminance"
license=('GPL')
depends=('python-efl' 'python-xdg')
makedepends=('git')
provides=('eluminance')
source=('git+https://github.com/DaveMDS/eluminance.git')
sha256sums=('SKIP')


pkgver() {
    printf "%s.r%s" \
        "$(cd ${srcdir}/eluminance; python setup.py --version)" \
        "$(cd eluminance; git rev-list --count HEAD)"
}

build() {
    cd "${srcdir}/eluminance"
    python setup.py build
}

package() {
    cd "${srcdir}/eluminance"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}