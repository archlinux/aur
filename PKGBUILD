# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.7.1
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
sha512sums_x86_64=('cd6c1642b39a78799246c453f177349bfba83a82a08117a9b3b97f2126156948765dc4f995f20c87cae760a7d1fa44f7845d8b20d85cc5608c91b809b50b99f9'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   '5a11d5149d0ccf5ad3710add746243b65d881f2883cd0e01d91f7c50208625fd4ecc284284264090d1996cf859345f296370ebc4930d38586de2bd573a655386'
                   '72ad74e2b740e43a9c7a063d8b289590d4b67c891d2b8c49e46f08173403ee03dff1f5d0917d6a59d79deea8901676c0bcc2253b9c1ad220d7d4ae3b5f1daa67')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
