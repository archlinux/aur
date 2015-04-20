# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=2.2.3
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('124949cc20689fa659ab12f1452613313ce0109cff6b6637075140cc9bc93bc5')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
