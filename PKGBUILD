# Maintainer: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-marketplace
pkgver=1.1.0
pkgrel=1
pkgdesc='Enable vscode marketplace in windsurf'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('0BSD')
install="${pkgname}.install"
source=('windsurf-marketplace.hook'
        'patch.py')
sha256sums=('6dded2716ea268d86abcc768613e63bc37837264bf6ceb11aca9652f23564dfd'
            'cbb67095313282989b34c1ff41e3717c2136ff6c010479ac841dfddf7fd68441')

package() {
  depends=('windsurf' 'python')

  install -Dm 644 "${srcdir}"/windsurf-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/windsurf/resources/app/patch.py
}
