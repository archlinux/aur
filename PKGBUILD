# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.3.0
pkgrel=2
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('86dd949d24c0fd7612d99f615028c68d483d681509f34b196916d2f27fa6e144cc5ebe559043466fc78fdec1dd57f3deba7139cf856478b07514eaa3f9a31327')
install=readme.install

package() {
  cd "$pkgname-$pkgver"

  # https://github.com/jtesta/ssh-audit/issues/67
  # ultimately this will go to /usr/bin/ but this works for now
  install -Dm755 $pkgname.py "$pkgdir/opt/$pkgname/$pkgname"
  cp -r policies "$pkgdir/opt/$pkgname"

  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
