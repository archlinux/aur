# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

_pkgname=terminal-typeracer
pkgname=typeracer-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'zlib')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/uploads/4fe12fec3afb8cca7339d53f469bfc95/${pkgname%-bin}"
              "${pkgname%-bin}-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('430c11677b4103fee8ee0e70a11cbf1922a42ef53b17d62e92c6b72c3b9198d54d4cc21e059a5af090b2071240228b9152cb9719ffa0e1ab09188eb9e94df264'
                   '37c5e6ca3f2b5b21cc5d6496fc43ac4be73e2875cd677231edf8162747806fa2a338e9f72e5e494081502d41919b6336f926e42876be0e7be32e396389e007c3')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
