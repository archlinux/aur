# Maintainer: Tom BH <tom@tombh.co.uk>
pkgname=rtx-bin
pkgver=1.28.5
pkgrel=1
pkgdesc='Runtime Executor (asdf rust clone)'
url='https://github.com/jdxcode/rtx'
source_x86_64=("https://github.com/jdxcode/rtx/releases/download/v${pkgver}/rtx-v${pkgver}-linux-x64.tar.gz")
arch=('x86_64')
license=('MIT')
conflicts=('rtx-git')
provides=('rtx')
sha256sums_x86_64=('40d8ec61c896f65f50448bb69c802f1b99fff4e9ed1bad314d0d923871a7a602')

prepare() {
  tar -xzf rtx-v${pkgver}-linux-x64.tar.gz
}

package() {
  cd "$srcdir/"
  ls -alh rtx/

  install -Dm755 rtx/bin/rtx "${pkgdir}/usr/bin/rtx"
  install -Dm644 rtx/man/man1/rtx.1 "${pkgdir}/usr/share/man/man1/rtx.1"
}

