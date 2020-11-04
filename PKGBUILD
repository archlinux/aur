# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=onefetch-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
arch=('x86_64')
url="https://github.com/o2sh/onefetch"
license=('MIT')
depends=('libgit2')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
               "${pkgname%-bin}-$pkgver-LICENSE.md::$url/raw/v$pkgver/LICENSE.md"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "${pkgname%-bin}-$pkgver-man.1::$url/raw/master/${pkgname%-bin}.1")
sha512sums_x86_64=('5eb9e9e448a7320ea01ef1386e4cf341c9ab5e072bb8b349a7593b6ee684b335337ea0f8ba635936850bd3065128df170d2de5a97c52d3cf903e8de5dcd9a394'
                   '57e2b42cf721a6a4e6643ad5084cf5149e2639a9e91ac643e0f55adf77f0af36204ca74857fb0debbb22b34123c86e2ec8020aa41c19d8d7b7463a9f85a0e87d'
                   '0694cb9048f1b9d5e5a09061f0b199f5d2c5f693e9081a495524dadf751703d11046b681fb7e0f2a287a2de10401b529fa3d2732c2ce06a566e1030247b367b3'
                   '95c27f7924e8b2f0132f474466fc03227cc2469b5dff2ab3e19fbb6c7cc3d5cfb2e8594287c869b56dc2836c6bc0e630ea3a9a68776614786678984282d18acb')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
