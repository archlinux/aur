# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.25
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('60f01afdbfc623fc9036c83c99371e67ed8366d1313c5cc1154b76a900c62dae')
sha256sums_aarch64=('fe6b594da97b79acfce6a9428a6bddc14b131529494035a93a7791d05e8f7df7')

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
