# Maintainer: Tom BH <tom@tombh.co.uk>
pkgname=rtx-bin
pkgver=1.27.10
pkgrel=1
pkgdesc='Runtime Executor (asdf rust clone)'
url='https://github.com/jdxcode/rtx'
source_x86_64=("https://github.com/jdxcode/rtx/releases/download/v${pkgver}/rtx-v${pkgver}-linux-x64.tar.gz")
arch=('x86_64')
license=('MIT')
conflicts=('rtx-git')
provides=('rtx')
sha256sums_x86_64=('3585244a1bb60d3185479c0a80d3c586201932db6ffb7050282049f0c21d91ad')

prepare() {
  tar -xzf rtx-v${pkgver}-linux-x64.tar.gz
}

package() {
  cd "$srcdir/"
  ls -alh rtx/

  install -Dm755 rtx/bin/rtx "${pkgdir}/usr/bin/rtx"
  install -Dm644 rtx/man/man1/rtx.1 "${pkgdir}/usr/share/man/man1/rtx.1"
}

