# Maintainer: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=devin-features
pkgver=1.2.0
pkgrel=1
pkgdesc='Unblock some features in Devin Desktop (formerly windsurf-features)'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('0BSD')
depends=('devin-desktop' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('devin-features' 'windsurf-features')
replaces=('windsurf-features')
conflicts=('windsurf-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
sha256sums=('ee87f3244727f35a0d9f8e0438807039fd8266dbce4da8ef58680fa888927e9f'
            '22ca67a4622bbf3523f4c184749407b18c6a06184ba11d19c1b52992d3cfc6b8'
            'd30965a5f2b93ea121a9ecf2a54c7f435572dd9adfe906e7429c9f3ac74e0c4e')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
