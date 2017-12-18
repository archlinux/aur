# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=2.20.0
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
changelog=changelog.txt
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib'
         'python2-html2text')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('75b2544c4d3fb2fd8bcadf874ec9db05d20596b00a7099e5cfaad7028dd066e8')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
