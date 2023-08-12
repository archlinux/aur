# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=debtap-mod
pkgver=23.01.28
_pkgver=${pkgver}-1651
pkgrel=1
arch=('any')
license=('GPL')
depends=('yad' 'namcap' 'pamac' 'zenity' 'fakeroot')
conflicts=('debtap')
url="https://github.com/biglinux/debtap-mod"
pkgdesc="Debtap mod and GUI script to convert and install .deb packages"
source=("https://github.com/biglinux/debtap-mod/archive/refs/tags/debtap-mod-${_pkgver}.tar.gz")
sha256sums=("7ca863abbc841d2add501bab7ccfc7d6fd447468b8df9b1b439589d034cc645e")


package() {
# Default Folder
        InternalDir="${srcdir}/${pkgname}-${pkgname}-${_pkgver}"

    # Copy files
    if [ -d "${InternalDir}/usr" ]; then
        cp -r "${InternalDir}/usr" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/etc" ]; then
        cp -r "${InternalDir}/etc" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/opt" ]; then
        cp -r "${InternalDir}/opt" "${pkgdir}/"
    fi
}
