# Maintainer: Ruturajn <nanotiruturaj@gmail.com>
pkgname=sunity-cursors-git
_pkgname=Sunity-cursors
pkgver=2.0.r3.g0f4e801
pkgrel=1
pkgdesc="Cursor theme using a custom color palette and based on Breeze and Radioactive cursors themes."
arch=('any')
url="https://github.com/alvatip/${_pkgname}"
license=('GPL')
makedepends=('git')
provides=('sunity-cursors')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    # This command, firstly, replaces the first occurence of a `-`, with
    # a `-r`, then it replaces every occurence of a `-` with a `.`.
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"
    mkdir -p "${pkgdir}"/usr/share/{icons,licenses/"${_pkgname}",doc/"${_pkgname}"}
    cp -r "${_pkgname}" "${pkgdir}/usr/share/icons"
    cp -r "${_pkgname}-white" "${pkgdir}/usr/share/icons"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
