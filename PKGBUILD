# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features-insiders
pkgver=1.70.0
pkgrel=1
pkgdesc='Unblock some features in Code OSS, including features in VSCode Insiders'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'sed' 'org.freedesktop.secrets')
optdepends=()
provides=('code-features')
conflicts=('code-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('6ff3e599956e45e9d1a78ac3c88c0454'
         'aa94e56cf041781ed7a7a4a4623e9edf')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
