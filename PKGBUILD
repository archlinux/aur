# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.2.1
pkgrel=1
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

md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')
md5sums_aarch64=('6a264f92881fcfa3149447608b8fb819')
md5sums_armv7h=('0198fc851cfe2788d1e58c47fa5d359e')
md5sums_i686=('bc8228999d1368da3088bddcfbb6c304')
md5sums_x86_64=('4c570f626384b294809ef094a6465714')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  install -vDm 755 ${pkgname%-bin}.so.4.8.0 -t "$pkgdir"/usr/lib/
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so.4
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}.so
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
