# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

_pkgname=terminal-typeracer
pkgname=typeracer-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'zlib')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/uploads/f8b8d4b1c7fca37aca68c36452df1e3a/${pkgname%-bin}"
              "${pkgname%-bin}-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('430c11677b4103fee8ee0e70a11cbf1922a42ef53b17d62e92c6b72c3b9198d54d4cc21e059a5af090b2071240228b9152cb9719ffa0e1ab09188eb9e94df264'
                   'ceb9c22dfba27efc85d47451ab06a66fc8bf650f7bb579c86164e7fc2059d69e0274992fcd405689cca5d58a2c424f897ef583b557e9cfa5e55c8857d8889cb7')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
