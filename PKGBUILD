# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>

pkgname=vscodium-bin-marketplace
pkgver=1.56.0
pkgrel=6
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-bin' 'sed')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'patch.sh')
sha256sums=('bd53744ef5bd5b0521af26f9f0774e92f39d37a19d3fb76ed764e591e8052c00'
         '891ff64322af487b247e12548042ab24aa21236e383011787260093d6ae5500a')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/opt/vscodium-bin/resources/app/patch.sh
}

