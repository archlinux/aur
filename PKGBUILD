# Maintainer: FPTN Project <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.3.34
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('14d39c938d5af6e03a0afa56f8787ac89a5b39db2bb53498c57d835e9886772b')
sha256sums_aarch64=('87b3b7f3d724f13037fef43628e8dcdfc75d2ba92a99462f0001f517de6776c2')

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
