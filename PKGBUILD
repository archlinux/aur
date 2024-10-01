# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.93.1
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
         '9ed6f3972479ab6d3d053e7c47ead55a'
         '86e3001c574d25c851c4b28b1bcfa5cf')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/code-marketplace/patch.py
  install -Dm 644 "${srcdir}"/patch.json "${pkgdir}"/usr/share/code-marketplace/patch.json
}
