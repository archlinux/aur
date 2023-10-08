# Maintainer: silverhikari <kerrickethan@gmail.com>
# Contributor: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-features
pkgver=1.82.0
pkgrel=4
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
        'patch.py'
        'patch.json')
md5sums=('1bcee9b164af06e67f2d557663828d12'
         '67726a5b05e16c9b1ed03d127f0ebc1e'
         '5cdf96d72d223e73827626bc3bb3e176')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
