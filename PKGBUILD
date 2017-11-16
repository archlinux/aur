# Maintainer: C. N. Hsing <jlhs@users.noreply.github.com>
pkgname=enchive
pkgver=3.3
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

  ## FIXUP: license, readme, also for emacs intergation
  install -pDm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -pDm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -pDm644 enchive-mode.el "$pkgdir"/usr/share/emacs/site-lisp/enchive-mode.el
}

sha512sums=('bfe7d305bb18f52fd9766b1704f4af01e554a60cb300f43cd1755e38c15bcab4319d11babdf1d898d3f98e3298835bf3d086e7e912f9eaeae5cdf29e8f6c917d')
