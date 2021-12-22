# Maintainer: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-features
pkgver=1.56.0
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-bin' 'sed')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-bin-features')
conflicts=('vscodium-bin-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh')
md5sums=('9c0fcfdb3427f4a7705114eedbd3b6b8'
         '486c3bf8ef2c355330cbad53609f6b1e')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
}
