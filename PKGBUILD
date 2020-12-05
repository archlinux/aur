# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli-bin
_pkgname=globe
pkgver=0.2.0
pkgrel=2
pkgdesc="ASCII globe generator"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-x64-linux"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('d6ae2309ccf5e3ff9eed8cc2749d4cdf5de7154d4a530f76e9987aa4aafdc340341219b8d2c1aa0b9389baafe7e79d3f30dedf940da5cbdb6cf5dd7b171008b0'
                   'c003b4c8b2a352ffa47109c4a33d053f3d83a1dacefffc37bf635aadacd25135395ac9ec0fba86f13ba5093ab1c30ae1f802550fe381eaf16e36fbf064840c56')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
