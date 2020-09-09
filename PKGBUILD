# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hadlock-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="X window manager"
arch=('x86_64')
url="https://github.com/AdaShoelace/hadlock"
license=('MIT')
depends=('dbus' 'libxinerama')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("${pkgname%-bin}::$url/releases/download/v$pkgver/Hadlock"
        "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums=('0bb503b42a7e6c0125c2ccb7372b05f29ca15be3270029da8361dfdbd9a872aacaa2849786918177de82c54361cecb4772dcb0187fd5988dff6e6972160708d2'
            '30c4c2d74fa7895ac61b21ad3e850b22cd4769a45be19a3f17af94ac0ae0c764ef049612b2c090d665bca28863bb7994a4e2ef6378ad0a3a7bb84596e4322321'
            'e717de20d70b47ae7eb47eef7bfe9a01cb9ed2db32cd2dd552c85cd8eb35ce63030f7246e065d5419a783ee9009e40284893585674fa7264b410831e43690c91')

package() {
  install -Dm 755 ${pkgname%-bin} -t "$pkgdir/usr/bin"
  install -Dm 644 ${pkgname%-bin}-$pkgver-README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 ${pkgname%-bin}-$pkgver-LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
