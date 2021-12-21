# Maintainer: Rafael Silva <perigoso@riseup.net>
pkgname=code-hide-notifications
pkgver=1.0.0
pkgrel=1
pkgdesc='Hide the annyoing bottom right notification toasts in Code OSS'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'sed')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('cc326c6aa4f04f9ae73601b2b27179d2'
         '7dca8b52b37913aaacc0d77b5f2e424d')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
