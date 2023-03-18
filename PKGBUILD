# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>

pkgname=vscodium-bin-marketplace
pkgver=1.76.0
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'patch.py')
 sha256sums=('a5236b4dd9662e7015e39593eb1611059cf35c202f538518ca04089dbe701958'
          'eb25bec26234a9493f7632c387d8d0963bb5dfd625478a19a32b6c2a1f37c090')

package() {
  depends=('vscodium-bin' 'python')

  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/opt/vscodium-bin/resources/app/patch.py
}

