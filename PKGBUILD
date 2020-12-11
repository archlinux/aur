# Maintainer: Masoud Naservand <masoud.naservand@gmail.com>

pkgname=dwmstatus_iran
pkgver=1.0
pkgrel=1
pkgdesc='fork of dwmstatus changed to show iranian(jalali) calendar and other changes'
url="https://codeberg.org/masoudd/dwmstatus_iran"
arch=('any')
license=('MIT')
depends=('libx11' 'jcal-git')
makedepends=('git')
source=("git+https://codeberg.org/masoudd/dwmstatus_iran")
md5sums=('SKIP')


prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout ${pkgver}
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}


package() {
    mkdir -p "${pkgdir}/usr/bin"
    install --mode 755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
}

