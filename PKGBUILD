# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.37
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('c4e209fac7c27d47c5b9bf703943e6b16554b8bc52f9c73202512d6823405647')
sha256sums_aarch64=('287b4b717f6e5705c2dce6c150b9b1bfb5a0f4c6719fcb761d9b26670440ea53')

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
