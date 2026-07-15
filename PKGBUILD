# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.19
pkgrel=1
pkgdesc='活在终端里的二次元少女'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('chafa' 'gcc-libs' 'ripgrep' 'alsa-lib')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
source=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('5af20f8ccb478efeae06dc3ec7b3e4025129c26557e442d2d82c05d6e8cd8d91')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
}
