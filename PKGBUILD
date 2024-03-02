# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features
pkgver=1.87.0
pkgrel=2
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
         '1d9f06e2ed16e3100f41eb6c69a81638')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
