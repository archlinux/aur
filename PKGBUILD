# Maintainer: Gabriel M. Dutra <me@sizeofnull.xyz>

pkgname=gitui-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Fast terminal-ui for git written in rust"
arch=('x86_64' 'aarch64')
url="https://github.com/gitui-org/gitui"
license=('MIT')
source_x86_64=("gitui_${pkgver}_${CARCH}.gz::https://github.com/gitui-org/gitui/releases/download/v$pkgver/gitui-linux-x86_64.tar.gz")
source_aarch64=("gitui_${pkgver}_aarch64.gz::https://github.com/gitui-org/gitui/releases/download/v$pkgver/gitui-linux-aarch64.tar.gz")
sha256sums_x86_64=('e58bd776170ac71e4e576c60ebaa7ccfb770f079e78eb4b2d3f4c0d4feafdd9f')
sha256sums_aarch64=('1a3e268b7e8410c43210e8a9a5f126b8c088284e270e5d7872ff432e3a84d489')


check() {
  ./gitui --version
}

package() {
  cd "${srcdir}"
  install -Dm755 "gitui" "$pkgdir/usr/bin/gitui"
}

