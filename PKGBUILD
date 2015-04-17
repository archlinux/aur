# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=2.2.2
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bb6fd49e0fd64d847d75b1a3278b86f6b400b4dd433c452b6eb0c28455e7b540')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
