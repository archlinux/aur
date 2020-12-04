# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.50.1
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS and VSCodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
optdepends=('code: for Code OSS'
            'vscodium-bin: for VSCodium')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'code-product.json.patch'
        'vscodium-bin-product.json.patch')
md5sums=('dc1b0dedb41767bf2511bbeee3715a02'
         '9e476c8aae4243010d6a1c18e56ac402'
         '26be4c7916e72598198d9b3b19945311')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 644 "${srcdir}"/code-product.json.patch "${pkgdir}"/usr/share/code-marketplace/code-product.json.patch
  install -Dm 644 "${srcdir}"/vscodium-bin-product.json.patch "${pkgdir}"/usr/share/code-marketplace/vscodium-bin-product.json.patch
}
