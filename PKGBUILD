# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
arch=('x86_64')
url="https://github.com/o2sh/onefetch"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
depends=('libgit2')
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
               "${pkgname%-bin}-$pkgver-LICENSE.md::$url/raw/v$pkgver/LICENSE.md"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "${pkgname%-bin}-$pkgver-man.1::$url/raw/master/${pkgname%-bin}.1")
sha512sums_x86_64=('6f150383324fb40c1168ef2458837ad19bdad13e29e3658e2b05e7fbc55a800080ff2c2e05110ef38c4b633239f6bc78173731603d59038ff3d6a863f4cf13ea'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   'f72f8b11f9ebee0c4e5716692bc731069c63ff72672d5ba37e94fd58bc236776c99f795b6d0ec92b823c86ef7ab41250e5d12d48f8c9a6b5b26dab360d13c09a'
                   'SKIP')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
