# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-koi-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Draw a pixel-art koi GIF from a GitHub account's public activity"
arch=('x86_64' 'aarch64')
url="https://github.com/yalongwastaken/git-koi"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/git-koi-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/git-koi-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('2e5ea416ff3667685516b47a8091037ca3c1878267f19b26446a2c41431a776d')
sha256sums_aarch64=('e312e80f1efbb60a5a027a0303a8332b9c908845cf05c2d652d3d48e7252d38c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="git-koi-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="git-koi-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/git-koi" "${pkgdir}/usr/bin/git-koi"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
