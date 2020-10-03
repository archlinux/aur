# Maintainer: CamuseCao camusecao@gmail.com
pkgname=spx2wav
pkgver=0.0
pkgrel=1
pkgdesc="微信高清语音 spx 转 wav 解决方案, 基于 speex-devel 和微信官方提供的 declib, 修改了部分错误，重写了 Makefile，在 Debian & CentOS & Arch 下测试通过"
arch=('x86_64')
url="https://github.com/baogaitou/spx2wav"
license=('unknown')
depends=('speex' 'lame')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "./$pkgname"
  make
}

package() {
  cd "./$pkgname"
  install -D $pkgname "${pkgdir}"/usr/bin/$pkgname
}
