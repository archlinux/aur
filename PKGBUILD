# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.7.3
pkgrel=1
pkgdesc="Git repository summary on your terminal"
arch=('x86_64')
url="https://github.com/o2sh/onefetch"
license=('MIT')
depends=('libgit2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
               "$pkgname-$pkgver-LICENSE.md::$url/raw/v$pkgver/LICENSE.md"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/master/${pkgname%-bin}.1")
sha512sums_x86_64=('770ab738b53d018ecb29120bedee984e70a44be1beddc23614e2a43beabf41472e00a7e46f6bdf8bd9a7eb7dc6da293da2f2787c8167c09c1c99ab6a37758f2e'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   'a03f15eef94e309db544d6105c8954912984b34dbd9c19138407a4b93494aa9fd574d7406810c0b102b993a77e842075e857c8e2cb9591157290a1e35da68d5e'
                   '93157123ec5dedcc0c036615b2cd3dd706adcdbc9e35b5b8f90c2e9abe78358a3e8bea1e7b19cb418ceadd6f30165a06438219746c1a0852bc6488bdcd3c4660')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
