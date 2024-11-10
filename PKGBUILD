# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=aide-bin-marketplace
pkgver=1.94.0
pkgrel=1
pkgdesc='Enable vscode marketplace in aide-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('aide-bin-marketplace.hook'
        'patch.py')
 sha256sums=('367fea9b04e28f22b172dc6b8a7609c9322bade89c2e7c07f4c8b2ee65f53259'
          '4e2389a33902dbaef2d526123346dcf40140a8dada56760aef8dc2c12af453af')

package() {
  depends=('aide-bin' 'python')

  install -Dm 644 "${srcdir}"/aide-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/aide-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/opt/aide/resources/app/patch.py
}

