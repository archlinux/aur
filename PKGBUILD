# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features
pkgver=1.78.0
pkgrel=1
pkgdesc='Unblock some features in Code OSS'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'sed' 'org.freedesktop.secrets')
optdepends=('icu69: for MS-vsliveshare.vsliveshare extension to work')
provides=('code-features')
conflicts=('code-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('5d5bd889095a60ffbf1918d5a2a08bdb'
         'ee4d92f94681b0e0f5ef4b656e49b501')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
