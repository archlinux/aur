# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.12.5
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname" "${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('58faedb0e891d338a1d821cfa090c0f17c67f9654a5a1b19f5a98a5a15bec8aa7d2caca9574ca130942e72df0e44ef75e8222a93e66e84f2b86921593d517331'
                   'eb75e7eff11900c5dfb4e0916cfb2d951409e4efb4478745872cfbf0a194a7f1135378241565c56f34fd64998a08ff1024a2d223fef3023236b51e87bce60756')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
