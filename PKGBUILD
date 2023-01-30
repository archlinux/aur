# Maintainer: silverhikari <kerrickethan@gmail.com>
# Contributor: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-features
pkgver=1.74.0
pkgrel=5
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-bin' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-bin-features')
conflicts=('vscodium-bin-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py')
md5sums=('a79c54f622b6c12c78bca12753711c7a'
         'd3911dc497ccc9aa520d6e46149a9399')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/opt/${pkgname}/patch.py"
}
