# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-totalmix-web-remote-bin
_pkgname=linux-totalmix-web-remote
pkgver=0.1.0
pkgrel=1
pkgdesc="Mobile web remote (PWA) and OSC bridge for linux-fireface-mixer (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/oudeis01/linux-totalmix-web-remote"
license=('GPL3')
depends=('gcc-libs')
optdepends=('linux-fireface-mixer: the desktop mixer this remote controls')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$_pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64")
source=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE"
        "README-$pkgver.md::${url}/raw/v${pkgver}/README.md"
        "README-kr-$pkgver.md::${url}/raw/v${pkgver}/README-kr.md")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '4546517a7045bcb9a1908fccc7b8bde63174998b95146eda3196a7466c1910d7'
            '2742ea9c5528e689092279f31a62a2c4e565a70741c689b001bdb7f8e1cdcfb6')
sha256sums_x86_64=('e6a1a5d8820e9a017224e930435e00a10fc879af320f010c2997ad42739c357a')

package() {
  install -Dm755 "$srcdir/$_pkgname-x86_64-$pkgver" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
