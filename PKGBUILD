# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features
pkgver=1.90.0
pkgrel=1
pkgdesc='Unblock some features in Code OSS'
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
md5sums=('1d4002cba0560dd6da192ddd756f52e5'
         '9ed6f3972479ab6d3d053e7c47ead55a'
         'fcf4d1276e0fcfdb111ef17fcba5965c')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
