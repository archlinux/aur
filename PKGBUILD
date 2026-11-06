# Maintainer: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=devin-marketplace
pkgver=1.3.0
pkgrel=1
pkgdesc='Enable VS Code marketplace in Devin Desktop (formerly windsurf-marketplace)'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('0BSD')
depends=('devin-desktop' 'python')
provides=('devin-marketplace' 'windsurf-marketplace')
replaces=('windsurf-marketplace')
conflicts=('windsurf-marketplace')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py')
sha256sums=('09f7894edda7124ae62731afb97d7d1e080450af3730df411dd61dd848c6e27e'
            '6c62c3d17675c8699bc8829d2ba8ab2be6dc80a901011fe3646d7142e49711e7')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/devin-marketplace/patch.py"
}
