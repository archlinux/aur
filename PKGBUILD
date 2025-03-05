# Maintainer: gonsolo <gonsolo@gmail.com>
pkgname=opensbi
pkgver=1.6
pkgrel=1
pkgdesc="RISC-V Open Source Supervisor Binary Interface"
arch=(any)
url="https://github.com/riscv-software-src/opensbi"
license=('BSD')
depends=('filesystem')
provides=('opensbi')
options=('!strip')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-rv-bin.tar.xz")
md5sums=('de1644ef1c898be11c6624da46be92e2')

package() {
    cd "$pkgname-$pkgver-rv-bin"
    mv ./lib64/lp64 ./lib/lp64
    find ./ -type f -exec install -Dm 644 {} ${pkgdir}/usr/{} \;

}
