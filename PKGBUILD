# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lyrtui-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="TUI for Lyrion Music Server"
arch=('x86_64' 'aarch64')
url="https://github.com/hjelev/lyrtui"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-LICENSE::https://raw.githubusercontent.com/hjelev/lyrtui/fead3d7b08845b37d611169f27b09636b6005980/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/lyrtui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/lyrtui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('ba4a986e682723b6e8cb3d33682becf70b8496eef236f5188db22d8f8f266e80')
sha256sums_x86_64=('7ae431d4446cd566d3629344dcfec62d38a2492c67cd718ac982180183b81241')
sha256sums_aarch64=('c90cffe2d9ea73f483e0d34d471bdc4b5c0c0039f5e11cf80818e7128b3d3134')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="lyrtui-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="lyrtui-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/lyrtui" "${pkgdir}/usr/bin/lyrtui"
  install -Dm644 "${srcdir}/${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
