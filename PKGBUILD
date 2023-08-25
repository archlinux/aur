# Maintainer:  Misaka13514  <Misaka13514 at gmail dot com>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-server-marketplace
pkgver=4.16.1
pkgrel=1
pkgdesc='Enable vscode marketplace in code-server'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code-server' 'python')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
md5sums=('da6d9b1eb0b8e215535105e6b47e52e7'
         '45c1125f9a3b228c313634de795b9263'
         '007961321f2c9f066b2c55a9cd3899cf')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
