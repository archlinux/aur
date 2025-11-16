# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.106.0
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code' 'python')
optdepends=('code-features: unblock some extensions specific to the official build')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'patch.py'
        'patch.json')
md5sums=('ce502275aa945985182b51420fc6037c'
         '8ff44c81624f63e20884531715896ef3'
         '0b5d20c86e0ae1c1ce2951cfb40d0e77')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/code-marketplace/patch.py
  install -Dm 644 "${srcdir}"/patch.json "${pkgdir}"/usr/share/code-marketplace/patch.json
}
