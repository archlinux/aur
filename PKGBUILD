# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.40
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('e2f3e7f6e92f18e0cfd799d88da83ae0e409646e02f18c8684ce8540ad365545')
sha256sums_aarch64=('7a8b2ac3bd2918bdc8b793be8121955852f1a2ff2cbb066c602753059906c531')

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
