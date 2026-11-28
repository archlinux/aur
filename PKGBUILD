# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=qq-maid-bot-bin
pkgver=0.26.1
pkgrel=1
pkgdesc="AI agent bot for QQ via OneBot 11"
arch=('x86_64' 'aarch64')
url="https://github.com/kuliantnt/qq-maid-bot"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kuliantnt/qq-maid-bot/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/qq-maid-bot-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/qq-maid-bot-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('2104af33d95ff56146e5fb64ac1b41f7c5476bbe6b6cb28cd63eb2d818a9b8fc')
sha256sums_x86_64=('6483bc22df1a5321aa19d99140a87a2f70606d8d82e28e8d5f2e2ff8c88ce09d')
sha256sums_aarch64=('87f8840caa82d0081197cb604d8ed564c01e92a444dd7fe396d3c7ecc71273b1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="qq-maid-bot-v${pkgver}-linux-x86_64" ;;
    aarch64) _dir="qq-maid-bot-v${pkgver}-linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/qq-maid-bot" "${pkgdir}/usr/bin/qq-maid-bot"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
