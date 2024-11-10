# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=aide-bin-features
pkgver=1.94.0
pkgrel=1
pkgdesc='Unblock some features in aide-bin'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('aide-bin' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('aide-bin-features')
conflicts=('aide-bin-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
md5sums=('47e122a517d034c65bee4ff4dab76d7f'
         '3e2b65d9c6feb3c722a3ad00c0b0e609'
         'cd8c00b19928cbe6d2816bdd0b45fccf')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
