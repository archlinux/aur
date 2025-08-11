# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.2.0
pkgrel=2
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
md5sums_aarch64=('2f0886246a446d76b6d97e95fcbefa52')
md5sums_armv7h=('b36de16194c56e77a7af05b4dcd34acf')
md5sums_i686=('11dc547ac1e51824d9d8b676c71aedd6')
md5sums_x86_64=('da44a4304d29eb94c92e4ea6d3941e31')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  install -vDm 755 ${pkgname%-bin}.so.4.8.0 -t "$pkgdir"/usr/lib/
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so.4
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}.so
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
