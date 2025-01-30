# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=mgccli
pkgver=0.31.1
pkgrel=1
pkgdesc="Magalu Cloud CLI"
arch=("x86_64")
url="https://github.com/MagaluCloud/mgccli"
license=("GPL3")

source=("$pkgname-$pkgver.tar.gz::https://github.com/MagaluCloud/mgccli/releases/download/v${pkgver}/mgccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3dbcc713933d5b65cbfd10400d165fcb0b72e94b82f92b73b874e998c6a24a27')

build() {
  ./mgc completion basg > mgc.bash
}

package() {
  install -Dm 0644 mgc.bash ${pkgdir}/usr/share/bash-completion/completions/mgc
  install -Dm 0755 mgc ${pkgdir}/usr/bin/mgc
}
