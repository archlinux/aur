# Maintainer: derivativeoflog7 <derivativeoflog7+aur at outlook dot com>
# Contributor: PatJK <patjk at ik dot me>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: Icelk <main at icelk.dev>

pkgname=vscodium-electron-bin-marketplace
pkgver=1
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-electron-bin. Based on vscodium-electron-marketplace.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('vscodium-electron-bin-marketplace.hook'
        'patch.py')
 sha256sums=('2432be58df9b34c2e6864721ac2832911621b8e7e8f9c7d87a48e24faef0dd86'
          '324851b109c0bb86ad939cb868c0092020ba8369eef6c805ad8a2b66891f3824')

package() {
  depends=('vscodium-electron-bin' 'python')

  install -Dm 644 "${srcdir}"/vscodium-electron-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-electron-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/lib/vscodium-electron/patch.py
}

