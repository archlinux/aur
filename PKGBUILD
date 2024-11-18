# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-bin-features
pkgver=1.94.0
pkgrel=1
pkgdesc='Unblock some features in windsurf-bin'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('windsurf-bin' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('windsurf-bin-features')
conflicts=('windsurf-bin-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
sha256sums=('314ec90f7378ad23f4e5119961b7168f41caf75d3315108080f0673bed872df4'
         'a344013e6580fd6f73312c08c5930f56e9f6f95ed14af82b83681efe96ffcd7b'
         'd30965a5f2b93ea121a9ecf2a54c7f435572dd9adfe906e7429c9f3ac74e0c4e')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
