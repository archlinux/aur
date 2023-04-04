# Maintainer:  Misaka13514  <Misaka13514 at gmail dot com>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-server-marketplace
pkgver=4.11.0
pkgrel=1
pkgdesc='Enable vscode marketplace in code-server'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code-server' 'sed' 'grep')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('fdea8cc43f62df3ac4db82f916a5d22a'
         'e84342a5da3584cf9a7e446cd49b76f2')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
