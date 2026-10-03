# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.4.6
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('e01e2784f3ba7789e3d9462c71ef48dbaa8e9d944bd333dcb59d494e14281fa5')
sha256sums_aarch64=('ba09ff27e24c9abeebbede6276b5a806d998c534ff7fa6710224a49e7cd2f5d8')

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
