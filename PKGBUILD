# Maintainer: gonsolo <gonsolo@gmail.com>
pkgname=opensbi
pkgver=1.7
pkgrel=1
pkgdesc="RISC-V Open Source Supervisor Binary Interface"
arch=(any)
url="https://github.com/riscv-software-src/opensbi"
license=('BSD')
depends=('filesystem')
provides=('opensbi')
options=('!strip')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-rv-bin.tar.xz")
md5sums=('31d0bcc2e5bcd045d7e12239923888eb')

package() {
    cd "$pkgname-$pkgver-rv-bin"
    mv ./lib64/lp64 ./lib/lp64
    find ./ -type f -exec install -Dm 644 {} ${pkgdir}/usr/{} \;

}
