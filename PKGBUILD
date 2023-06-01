# Maintainer: Sedrubal <aur at sedrubal dot de>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: Icelk <main at icelk.dev>

pkgname=code-oss-marketplace
pkgver=1.77.1
pkgrel=2
pkgdesc='Enable vscode marketplace in code oss'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('code-oss-marketplace.hook'
        'patch_code_oss_product.py')
 sha256sums=('138eb84d5e98b38f7d3cf8e38ff807dd6a6ea78e249c4f0fa96187d4db1f3528'
          'b5094739cc30beda5d677603352b005c8abe08e451037b1c4eea2ea74450ccf3')

package() {
  depends=('code' 'python')

  install -Dm 644 "${srcdir}"/code-oss-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-oss-marketplace.hook
  install -Dm 755 "${srcdir}"/patch_code_oss_product.py "${pkgdir}"/usr/local/sbin/patch_code_oss_product.py
}

