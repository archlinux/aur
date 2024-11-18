# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-marketplace
pkgver=1.94.0
pkgrel=1
pkgdesc='Enable vscode marketplace in windsurf'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('windsurf-marketplace.hook'
        'patch.py')
sha256sums=('6dded2716ea268d86abcc768613e63bc37837264bf6ceb11aca9652f23564dfd'
          'e184632d17838c709940f6d6b88d2439db91f9b523b657b9f5d21e4b3c4b80ce')

package() {
  depends=('windsurf' 'python')

  install -Dm 644 "${srcdir}"/windsurf-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/windsurf/resources/app/patch.py
}

