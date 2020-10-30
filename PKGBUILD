# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fw-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Workspace productivity booster"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}"
               "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "${pkgname%-bin}-$pkgver-README.org::$url/raw/v$pkgver/README.org")
sha512sums_x86_64=('5c8feb46e591e072ddf9a2f51465b41a0284df76564a024cea5317d2fcc024592eb8d98137619426a12bc6d1760d49020366031642f4020942e90e2a702b2896'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   '76b26aa870c139d701f2de5b81e3c0616b9924caae2f34b7801fa59e8d5155c3b8b3f1045eb7164c53e769e8d15c480bc3b020f27eedf2b590549c814e0c0383')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.org" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
