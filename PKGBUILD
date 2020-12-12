# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy-bin
pkgver=0.1.10
pkgrel=3
pkgdesc="Bare-bones SSH launcher"
arch=('x86_64')
url="https://github.com/xvxx/shy"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-linux-x86_64.tgz"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('9dab762e1dbe8ccb1c8be0ea2b69460bc08d9b664ef0b1061b71ce8ea44318d46a2b1554f6ca6477db577ed6056b549ec8bddebd41ce42f4b7f355bba8f8a5d0'
                   '35dfcd7980f4de2dfafd4ce335ad70f6a058dbcbdc57f91c85684676c19750daec61ecbec567d03cdd1ca5ee37477b49a23ebdea6c1ba48fc7c4d32800a00033'
                   'd50b0a0b11343c1c7b45c228c992a528e902fc879877b92ae6de86f98453a79e218dcd7eb2c2d0eccbfb04aa330c5827a476d19fbd3b7c9aca032708a4d2060a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
}
