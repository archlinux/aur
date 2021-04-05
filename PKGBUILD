# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.54.3
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS, and unblock some extensions that are specific to the official build.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code' 'sed')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'patch.sh')
md5sums=('b7442876feb4ba8b1ffb193b01fd4ff8'
         'e0c1391f5bceda0e23bf1219b8d4e6d3')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/code-marketplace/patch.sh
}
