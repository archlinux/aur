# Maintainer: Peter Schildmann <linux at schildmann dot info>
pkgname=stc8prog
pkgver=1.4
pkgrel=2
pkgdesc="STC MCU ISP flash tool"
arch=('x86_64' 'aarch64' 'riscv64')
license=('Apache')
url="https://github.com/IOsetting/stc8prog"
source=("$url/archive/${pkgver}.tar.gz")
depends=('glibc')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname-git")
sha256sums=('b76690e8d0c9d86fa467171722ff40dcb333d23e4987c70bce6418addfb59007')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 stc8prog -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 docs/README.md -t "$pkgdir/usr/share/doc/$pkgname/docs"
  install -Dm 644 docs/auto-download-schematics.png -t "$pkgdir/usr/share/doc/$pkgname/docs"
}

