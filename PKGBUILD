# based on vscodium-features
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=vscodium-features
pkgver=1.59.0
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium' 'sed')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-features')
conflicts=('vscodium-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('1f08c4648040bc4e90d483764851b421'
         '77d5a7cb93fd94ee0983d8fa3203a9b4')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
