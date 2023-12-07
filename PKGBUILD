# Mantenedor: Mauricio de Lima <emauricio@uaiso.org>
pkgname=uarchiso
pkgver=73
pkgrel=5
pkgdesc="Archiso for UaiSO"
arch=('any')
url="https://gitlab.com/uaiso/labs/uarchiso"
license=('GPL3')
makedepends=('git')
depends=(   'qemu-desktop'
            'openssl'
            'base-devel'
            'xorriso'
            )
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
        mkdir -p "${pkgdir}/home/$USER/uArchiso/"
        chmod -R 0777 "${pkgdir}/home/$USER/uArchiso/"
        cp -r "${InternalDir}/"* "${pkgdir}/home/$USER/uArchiso"
    fi
}
