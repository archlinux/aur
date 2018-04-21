# Maintainer: C. N. Hsing <jlhs@users.noreply.github.com>
pkgname=enchive
pkgver=3.4
pkgrel=1
pkgdesc="Utility for encrypting/decrypting single files with key pair"
arch=('x86_64' 'i686')
url="https://github.com/skeeto/enchive"
license=('custom:UNLICENSE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/skeeto/enchive/archive/$pkgver.tar.gz")

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install

  ## FIXUP: license, readme, and emacs intergation
  install -pDm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -pDm644 NEWS.md "$pkgdir"/usr/share/doc/$pkgname/NEWS.md
  install -pDm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -pDm644 enchive-mode.el "$pkgdir"/usr/share/emacs/site-lisp/enchive-mode.el
}

sha512sums=('a8149a95723159b2ef6b929be91fc8d6b454886706eb701ba9fd1dfcfea59e1d22aea734517c08fc252681a914a1a028589789683540c13aacfa979c13313f17')
