# based on vscodium-features
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=vscodium-features
pkgver=1.74.0
pkgrel=2
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-features')
conflicts=('vscodium-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py')
md5sums=('c83958259eb32492073e5e1390f4f5cd'
         'd3911dc497ccc9aa520d6e46149a9399')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
}
