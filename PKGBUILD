# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=runst-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A dead simple notification daemon"
arch=('x86_64')
url="https://github.com/orhun/runst"
license=('MIT' 'Apache')
depends=('dbus' 'pango')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('a52e5ab9b7babb398d12fa93606a16acedee8a7f0766a350a00fe179fd97b8e55d00ff2febf508ae3a227858f00415dc3f100bbfb779620f5719cae2259ec42d')

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
