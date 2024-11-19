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
         '04783af3e89f5f5b7502b0d60dd2eef322683073545d30b7bb58618d77865b31')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
