# Maintainer: txtsd <aur.archlinux@ihavea.quest>

_pkgname=archosaur
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.g1bc6939
pkgrel=1
pkgdesc="A PKGBUILD management framework for the Arch User Repository"
arch=('any')
url="https://github.com/txtsd/${_pkgname}"
license=('GPL3')
depends=('openssh')
makedepends=('git' 'asciidoc')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd ${_pkgname}

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_pkgname}

    make PREFIX=/usr
}

package() {
    cd ${_pkgname}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
