# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Small command-line JSON log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('custom:WTFPL')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}"
               "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "${pkgname%-bin}-$pkgver-README.org::$url/raw/v$pkgver/README.org")
sha512sums_x86_64=('fef318afb48dfc255b7102b3ba1e01f62ff549e5392ff8836393bde7b73db8215c313c0050fdc27bd13bb8391da368b9c7a4e9f5df2e6a4dafbd4ff4a1f30740'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   'cd12a62f6b3629ebbd0386290fb2a1c47dd7b82b1bf2626ac1a4c12fee0f1289e1174a7ab837bb4e76705422b049db7bebd9235950366397ec52a96a0e0d1494')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.org" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
