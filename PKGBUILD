# Maintainer: Mauricio de Lima <emauricio@uai21.com>
pkgname=uarchiso
pkgver=72
pkgrel=1
pkgdesc="Archiso for UaiSO"
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
    if [ -d "${InternalDir}/" ]; then
        mkdir -p ${pkgdir}/home/$USER/uArchiso
        cp -r "${InternalDir}/"* "${pkgdir}/home/$USER/uArchiso"
    fi
}
