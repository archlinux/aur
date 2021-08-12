pkgname=mir-jit
pkgver=0.1
pkgrel=1
pkgdesc='A lightweight JIT compiler and C11 JIT compiler/interpreter based on MIR'
arch=('any')
url='https://github.com/vnmakarov/mir'
license=(MIT)
depends=('gcc-libs')
makedepends=('git')
source=('git+https://github.com/vnmakarov/mir.git#branch=v_0_1')
md5sums=('SKIP')

build() {
  cd mir
  make
}

package() {
  cd mir
  install -Dm755 b2m "$pkgdir/usr/bin/b2m"
  install -Dm755 b2m "$pkgdir/usr/bin/b2ctab"
  install -Dm755 c2m "$pkgdir/usr/bin/c2m"
  install -Dm755 m2b "$pkgdir/usr/bin/m2b"
  install -Dm755 b2ctab "$pkgdir/usr/bin/b2ctab"
  install -Dm644 libmir.a "$pkgdir/usr/lib/libmir.a"
  install -d "$pkgdir/usr/include/"
  install -Dm644 mir*.h "$pkgdir/usr/include/"
  install -Dm644 c2mir/c2mir.h "$pkgdir/usr/include/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
