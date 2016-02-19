# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=FanFicFare
pkgname=fanficfare
pkgver=2.2.18
pkgrel=1
pkgdesc="A tool for downloading fanfiction to eBook formats"
arch=('any')
url="https://github.com/JimmXinu/${_pkgname}"
license=('Apache')
changelog=changelog.txt
depends=('python2' 'python2-beautifulsoup4' 'python2-chardet' 'python2-html5lib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c43eda398583cfc3620b935d5de7e1d0838abda3c9df471b11e2f8fcfef7fd0e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
