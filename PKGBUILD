# Contributor: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Carson Rueter <roachh at proton mail dot com>

pkgname=vscodium-features
# this version is equvalent of vscodium-bin-features 1.82.0-4
pkgver=1.82.2
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
depends=('vscodium' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
sha256sums=('25cc203f7c49f665ff460417768955c5bf308cfc82940a245e6636d8aa2c013e'
            '5539afacf560f9d5b14f9aea087b9f320922bf702877086d7886af91d632e659'
            '18266dd33e987ad007ea56da2533925d3ddb84e1bac9c013cb2d513b79c0d59b')

package() {
  install -Dm 644 ${pkgname}.hook "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 patch.py "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 patch.json "${pkgdir}/usr/share/${pkgname}/patch.json"
}
