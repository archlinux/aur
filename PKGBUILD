# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.35
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('ccd71ab3b3517f2b43e90cc16554c7a4ca216313d227b9ee7dbc749d2c869198')
sha256sums_aarch64=('c9dd103b742f5365241340e79536d20af87b48aea86f8a312ed2d4e8fdfeadf2')

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
