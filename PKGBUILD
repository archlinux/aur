# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.3.29
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('8a4d8df6cc86d50c085ece145965ee0bba1df64307303365d944871850b3fdef')
sha256sums_aarch64=('7b3b29d311029835326029acc812bcd281fecb0a9f81da0eb703354a4bbcd4cb')

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
