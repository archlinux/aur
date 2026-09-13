# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.4.5
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('ac983d86ca2661531f4a0e0a8acb4d932026808368b0e8c85a2fa9162c02690f')
sha256sums_aarch64=('f6daf1cb9b6e01db70951421655c63a307c59767e79d0f670557baa74e4eb3bb')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    # move /bin and /lib into /usr/bin and /usr/lib
    cd ${pkgdir}
    mkdir -p usr
    for dir in bin lib; do
      if [ -d ${dir} ]; then
        mv -f ${dir} usr
      fi
    done
}
