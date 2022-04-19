# Maintainer: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-features
pkgver=1.66.1
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
md5sums=('db01557a15a28a0a0c6c967cdcbb36e3'
         '3bf36543da8f91afc5e508877fbe9f0c')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/opt/${pkgname}/patch.sh"
}
