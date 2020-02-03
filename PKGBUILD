# Maintainer: Tom Carrio <tom@carrio.me>
pkgname=opentaxsolver
pkgver=17.01
_pkg=OpenTaxSolver2019_${pkgver}_linux64
pkgrel=1
epoch=
pkgdesc="OpenTaxSolver (OTS) is a free, safe + secure program for calculating Tax Form entries for Federal and State personal income taxes. It automatically fills-out and prints your forms."
arch=(x86_64)
url="http://opentaxsolver.sourceforge.net/"
license=('GPLv2')
source=(https://sourceforge.net/projects/${pkgname}/files/OTS_2019/v${pkgver}_linux/${_pkg}.tgz/download
    opentaxsolver.desktop)
sha256sums=('fd9edc79d9a7b5917a7654ee22c3415897667cd2b06e4b319fdb554fd9a0fbd5'
    '3e5f8be1464c6e5c1ff6aa8dc7c0d89b009763a4e20c2975b36c8129b72a81ab')

package() {
    _target="${pkgdir}/opt/${pkgname}/"

    install -d "${_target}"
    install -d "${pkgdir}/usr/share/applications"

    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cp -r "${srcdir}/${_pkg}"/* "${_target}" -R
}