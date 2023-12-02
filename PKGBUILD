# Maintainer: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Carson Rueter <roachh at proton mail dot com>

pkgname=vscodium-features
# this version is equvalent of vscodium-bin-features 1.82.0-4
pkgver=1.82.2
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-features')
conflicts=('vscodium-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
md5sums=('c6fcb99a315f5957bc1472597360d8b2'
         '8407481e2fc01c483957ca2bdd6dda9b'
         '5cdf96d72d223e73827626bc3bb3e176')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
