# Maintainer: Programador Occidental

pkgname='sugid-clearer'
pkgver=0.1
pkgrel=1
pkgdesc='Script to disable S[UG]ID bits for specified files'
arch=('any')
url='https://github.com/programadoroccidental/sugid-clearer'
license=('GPL3')
depends=()
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('a139fdcbba496b0fa2e931c606a95be5329152c50346969f4c0f043aaa4c9938f8346ae003bd9cf8e4c794c417beb307d34d1d82b5b24f84ed6bc01e3da2e13b'
            '5ba226a038dec561492e835a18505eddc779dea7c83625f6dff5ff78554f34752577e5fe62f4cdf489556590c79fb5d01e28e961a3b2128f49ca9455d9170321')
validpgpkeys=('9635F79DD28A4A2D42385AD1D2FDE81DBBAFBE5C')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install

  # Install the Pacman hook
  install -d "$pkgdir/usr/share/libalpm/hooks"
  install -m644 arch/sugid-clearer.hook "$pkgdir/usr/share/libalpm/hooks"
}

