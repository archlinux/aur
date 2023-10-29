# Maintainer: txtsd <aur.archlinux@ihavea.quest>

_pkgname=archosaur
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A PKGBUILD management framework for the Arch User Repository"
arch=('any')
url="https://github.com/txtsd/${_pkgname}"
license=('GPL3')
depends=('openssh')
source=("${url}/releases/download/1.0.0/archosaur-1.0.0.tar.gz")
sha256sums=('fceab3be5b7f74e382ac76d7dd28a2fe2a7fa54f84ba442460f14f473126d59b')

package() {
    cd ${srcdir}

    cp -a usr "${pkgdir}"
    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/local/share/"* "${pkgdir}/usr/share"
    rm -rf "${pkgdir}/usr/local/"
}
