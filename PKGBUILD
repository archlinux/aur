# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=whoamio
pkgver=1.0.0
pkgrel=1
pkgdesc="A universal IO process/file analyzer with Rouger personality mode"
arch=('any')
url="https://github.com/Zamanhuseyinli/whoamio"
license=('AGPL2')
depends=()
makedepends=('shc' 'curl')
source=("$pkgname.sh::https://raw.githubusercontent.com/Zamanhuseyinli/whoamio/main/whoamio.sh")
sha256sums=('SKIP')  # You can later replace with actual checksum if desired

build() {
  chmod +x "$srcdir/$pkgname.sh"
  shc -f "$srcdir/$pkgname.sh" -o "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 /dev/null "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
