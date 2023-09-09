# Maintainer: memchr <memchr@proton.me>
pkgname=code-appicons
pkgver=1.82.0
pkgrel=1
pkgdesc='Replace Code - OSS icons with VSCode icons'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'python')
provides=('code-appicons')
conflicts=('code-appicons' 'code-icons')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py')
md5sums=('1bf8b03d90da7ea0fcbe65f9501e2d2e'
         '295222824ccfcb3207adad69014feb70')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/lib/${pkgname}/patch.py"
}
