# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.29
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('1a32e25f0e021bfd3f17365fb77074e6e2bb4d3fea9c9641bf8cca6f87fa9818')
sha256sums_aarch64=('e5dc949e006ebd160a4b56154f9a064ab670d871e5efe46f535441f50cde98a6')

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
