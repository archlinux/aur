# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.30
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('0b0b6ee2396902ffb65676680711e9570fa668cc6398caefcfeb9fd97787fd71')
sha256sums_aarch64=('e3a5df15c24b828405fda6f87d7158b2fabcad61946c3e4d9363d8f5c5721cf4')

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
