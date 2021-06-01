# Maintainer: Yichao Zhou <zyc@berkeley.edu>
_pkgname=wmidump
pkgname=${_pkgname}-git
pkgrel=3
pkgver=r13
conflicts=(${_pkgname})
provides=("${_pkgname}=$pkgver")
pkgdesc="Dump WMI informations from ACPI tables"
arch=('i686' 'x86_64')
url="https://github.com/iksaif/wmidump"
license=(unknown)
depends=()
makedepends=(git)
source=("${pkgname}"::'git+http://github.com/iksaif/wmidump')
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${pkgname}"
    echo r`git rev-list --count HEAD`
}

build(){
    cd "${srcdir}/${pkgname}"
    make
}

package(){
  cd "${srcdir}/${pkgname}"
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
