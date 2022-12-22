# Maintainer: Mikhail Velichko <efklid@gmail.com>


pkgname=ast-firmware
pkgver=501
pkgrel=1
pkgdesc="Aspeed VGA module from the IPMI"
url="https://www.supermicro.com/support/faqs/faq.cfm?faq=26876"
license=('custom')
arch=('any')
source=("ast_dp501_fw.tar.gz::https://github.com/Labaman/ast-firmware/raw/main/ast_dp501_fw.tar.gz")
sha256sums=('58c24d2d5f5fb2b8eb000aef83b510c0ec95c87cdcd769620e489c589d7ae60a')

build() {
    bsdtar xvf "ast_dp501_fw.tar.gz"
    chmod 644  "${srcdir}/ast_dp501_fw.bin"
}

package() {
    install -Dm644 ${srcdir}/ast_dp501_fw.bin ${pkgdir}/usr/lib/firmware/ast_dp501_fw.bin
}
