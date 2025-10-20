# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.2.2
pkgrel=3
pkgdesc="Series of patches that make curl requests look like Chrome"
arch=(aarch64 armv7h i686 x86_64)
url=https://github.com/lexiforest/curl-impersonate
depends=(glibc)
license=(MIT)
provides=(${pkgname%-bin}-chrome ${pkgname%-bin})
conflicts=(curl-impersonate)
options=(!debug)

source=(https://raw.githubusercontent.com/lexiforest/curl-impersonate/master/LICENSE)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.aarch64-linux-gnu.tar.gz)
source_armv7h=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.arm-linux-gnueabihf.tar.gz)
source_i686=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.i386-linux-gnu.tar.gz)
source_x86_64=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.x86_64-linux-gnu.tar.gz)

sha256sums=('7d0c5f4b5b4c27299ad6759798772b866b3559ac5edb23845f36328eb734376d')
sha256sums_aarch64=('1d1db0fee9dbc3d29b71b128fac4fc60e952463b38902a8a1c39d64dfac293b4')
sha256sums_armv7h=('dc5a60ee89b3f1333d4b6da23efe79815ac514de3347efacd13dde7eb2eda3d0')
sha256sums_i686=('36594e4cd3b050863698b6b109088da694516703051cd2cb4a776b71e1fc0650')
sha256sums_x86_64=('9602bf79b803a9ae3c94446c2c69936c4202aab11122437dcdb51a0dcc4c4671')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  install -vDm 755 ${pkgname%-bin}.so.4.8.0 -t "$pkgdir"/usr/lib/
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so.4
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}.so
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
