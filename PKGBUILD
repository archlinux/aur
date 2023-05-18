# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-bin
_pkgname=sic
pkgver=0.22.3
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
depends=('gcc-libs')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu-v$pkgver.tgz"
               "$pkgname-$pkgver-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('90383893b23f538c9858727ddc8e44a0336988381e1f1852beae4248a01c7315f0dfbf4c9b5e2361e93715fabf920716fe47de0530c5210ecdb4b5c4a3e0981d'
                   '76e93decfd32f274563a31310f0eb97588d27f4627cb09d117ec1acaf1e62925309161971ff5e10963c39fbda90bd007b341e304b1f37a58a07362828b23afb9'
                   '5fbfd673d454a5d492babaceedac46607fb049452d4e5555794db21139e7e92a6c6d8cdd1d6b3bd0ca9dc756b8c2c7edaeb9137062344866f7703485b2d498e0')

package() {
  cd "$_pkgname-x86_64-unknown-linux-gnu-v$pkgver"
  install -Dm 755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
