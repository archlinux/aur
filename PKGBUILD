# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.102.1
pkgrel=2
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
         '10c1c73ea3977afb9b8954e5e8407d6e')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/code-marketplace/patch.py
  install -Dm 644 "${srcdir}"/patch.json "${pkgdir}"/usr/share/code-marketplace/patch.json
}
