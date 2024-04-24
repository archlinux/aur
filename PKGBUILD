# Maintainer: PatJK <patjk at ik dot me>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: Icelk <main at icelk.dev>

pkgname=vscodium-electron-marketplace
pkgver=1.88.1
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-electron'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('vscodium-electron-marketplace.hook'
        'patch.py')
 sha256sums=('d37a1669e611cfdb8eb10ade87f4fc8fd08db7444ce3e5746aa26330224b9252'
          '031690c95801436018c40bc3f607186b2c2a484b318907333b9227fc7fbf27e8')

package() {
  depends=('vscodium-electron' 'python')

  install -Dm 644 "${srcdir}"/vscodium-electron-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-electron-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/lib/vscodium/patch.py
}

