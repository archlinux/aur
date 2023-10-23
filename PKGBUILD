# Maintainer: Mauricio de Lima <emauricio@uai21.com>
pkgname=archiso-calamares-config
pkgver=73
pkgrel=1
pkgdesc="Calamares for Archiso"
arch=('any')
url="https://gitlab.com/uaiso/labs/uarchiso"
license=('GPL3')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${pkgname}::"git+${url}/${pkgname}")
sha256sums=('SKIP')

if [ -e "${pkgname}.install" ];then
    install=${pkgname}.install
fi

package() {

    InternalDir="${srcdir}/${pkgname}"

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
