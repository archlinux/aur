# Maintainer: xx777 <zenmchen@gmail.com>

_pkgbase=rtl8xxxu
pkgname=rtl8xxxu-dkms-git
pkgver=git_c8bc376
pkgrel=1
pkgdesc="Driver for Realtek RTL8XXXXU wifi chips"
arch=('any')
url="https://github.com/a5a5aa555oo/rtl8xxxu"
license=('GPL2' "custom")
depends=('dkms' 'linux-firmware>=20230404.2e92a49f-1')
makedepends=('git')
source=("git+https://github.com/a5a5aa555oo/rtl8xxxu.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"/${_pkgbase}
    install -Dm 644 firmware/rtl8192fufw.bin "${pkgdir}"/usr/lib/firmware/rtlwifi/rtl8192fufw.bin
    rm -rf firmware/
    mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
    cp  -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
}
