# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.50.1
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS and VSCodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'patch.sh'
        'code.patch'
        'vscodium-bin.patch')
md5sums=('86f0c2bc60b5843a41fd9d2f8bab0b5a'
         '5c3a49895d2d29a1878e8b9ba5764ef0'
         '0fe49bf0ff5d74f632bf3b5d435750ab'
         '060a4fc39945ca3c5a5c9e8136c343ad')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/code-marketplace/patch.sh
  install -Dm 644 "${srcdir}"/code.patch "${pkgdir}"/usr/share/code-marketplace/code.patch
  install -Dm 644 "${srcdir}"/vscodium-bin.patch "${pkgdir}"/usr/share/code-marketplace/vscodium-bin.patch
}
