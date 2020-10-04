# Maintainer: CamuseCao camusecao@gmail.com
pkgname=spx2wav
pkgver=r5.6322c0e
pkgrel=1
pkgdesc="微信高清语音 spx 转 wav 解决方案, 基于 speex 和微信官方提供的 declib, 修改了部分错误。"
arch=('x86_64')
url="https://github.com/baogaitou/spx2wav"
license=('unknown')
depends=('speex')
makedepends=('git')
optdepends=('lame: A high quality MPEG Audio Layer III (MP3) encoder')
conflicts=()
replaces=()
backup=()
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -D "$pkgname" "${pkgdir}"/usr/bin/"$pkgname"
}
