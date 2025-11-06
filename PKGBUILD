# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.3.23
pkgrel=2
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('42cdeed2f13a4fdebf6530a3a04825ee14b4e2da66debf19d9beefd35c3ae898')
sha256sums_aarch64=('74c77a6f1ed7de4b8794ff156243778434cf5ee816e7ef15814978397e8fa47e')

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
