# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('35dbc9c1987c63e71ecd59b98926c4b8a9d56d1fecfdb08f60ed1fc6524709e5')
sha256sums_aarch64=('6ac07de2856f3bde6c9bd8cf0d9d7e5db9aff9c0f0a02d3cf35c4ed7dd04771b')

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
