# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.0.0
pkgrel=5
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
md5sums_aarch64=('afe6f6aa80d57d2ed34e541aa8909fec')
md5sums_armv7h=('a34de6cb83f0ae61350d8d6eaf3043fa')
md5sums_i686=('658586c3ef5ca37cf8cf5de0cabf84dd')
md5sums_x86_64=('2880bc8532e5c0bb707fe80a978976c6')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  install -vDm 755 ${pkgname%-bin}.so.4.8.0 -t "$pkgdir"/usr/lib/
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so.4
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}.so
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
