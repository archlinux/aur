# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features-insiders
pkgver=1.87.0
pkgrel=2
pkgdesc='Unblock some features in Code OSS, including features in VSCode Insiders'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'python' 'org.freedesktop.secrets')
optdepends=('icu69: for MS-vsliveshare.vsliveshare extension to work')
provides=('code-features')
conflicts=('code-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
md5sums=('a270718448070ecda3050b7569510105'
         '9ed6f3972479ab6d3d053e7c47ead55a'
         'a17f01e570df18126948925f694ce4cd')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
