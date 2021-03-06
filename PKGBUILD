# Maintainer: JDuch <jduch+arch@pm.me>
# Based on aur/code-marketplace maintained by 
# Contributor: Sainnhe Park <sainnhe@gmail.com>

pkgname=code-proposed-api
pkgver=1.0.0
pkgrel=1
pkgdesc='Enable microsoft proposed api in Code OSS'
arch=('any')
url='https://visualstudio.com/vscode'
license=('unknown')
depends=('code')
install="${pkgname}.install"
source=("${pkgname}.hook"
        "product_json_enable_proposed_api.patch")
md5sums=('c9adf07e9a55d545e9c29808018b4037'
         'e4ea01755e0404aa6ef4de5c20e4ec1d')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 644 "${srcdir}/product_json_enable_proposed_api.patch" "${pkgdir}/usr/lib/code/product_json_enable_proposed_api.patch"
}
