# based on vscodium-features
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=vscodium-features
pkgver=1.82.1
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
        'patch.py'
        'patch.json')
md5sums=('c6fcb99a315f5957bc1472597360d8b2'
         'c081d5e736a56b0d8f93cab92183f418'
         'SKIP')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
