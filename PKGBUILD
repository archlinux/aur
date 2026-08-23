# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('d136f46493dcee767bcd09beee5ca1ea3fbd37eb5b1cfad310c5a0399c5c1f8f')
sha256sums_aarch64=('c6102a2e3d4fbae253d2b894ebf2b89de3c3539228799e2a16d3c2d3d262687c')

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
