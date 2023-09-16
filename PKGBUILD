# Maintainer: Geoffrey Teale <tealeg@gmail.com>
pkgname=opensbi
pkgver=1.3.1
pkgrel=2
pkgdesc="RISC-V Open Source Supervisor Binary Interface"
arch=(any)
url="https://github.com/riscv-software-src/opensbi"
license=('BSD')
depends=('filesystem')
makedepends=('filesystem')
provides=('opensbi')
options=('!strip')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-rv-bin.tar.xz")
md5sums=('0221698340a410f17ff8c76686b2e967')

package() {
    cd "$pkgname-$pkgver-rv-bin"
    mv ./lib64/lp64 ./lib/lp64
    find ./ -type f -exec install -Dm 644 {} ${pkgdir}/usr/{} \;

}
