# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.26
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('90476fc29a1af7413bf96a9cbfc62c1853134cc2083b1595149ca19ffdd945a3')
sha256sums_aarch64=('a67bc9c31736bdb1519f337063a2d9497dd9ce56fae06833a82fac6aee00c354')

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
