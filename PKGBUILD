# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.4.6
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('eb6ce55a2551d3953d7436c36f88a734c3a640b6f9a3a7be4943aebdee552782')
sha256sums_aarch64=('f8255b1bb9938c98a633a72c36944af58460592ed930c32a04f2116d6cdd4038')

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
