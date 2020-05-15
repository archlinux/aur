# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vlang-bin
pkgver=0.1.27
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software. Compiles itself in <1s with zero dependencies'
arch=('x86_64')
url="https://vlang.io"
license=('MIT')
provides=('vlang')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('719adbea053d362ea0941572f491e44b3092cb8b186c51f5ae20e8b07c11343b')

package() {
  install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
  install -Dm644 "${srcdir}"/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}"/v "$pkgdir/usr/lib/vlang"
  cp -a "${srcdir}"/examples "$pkgdir/usr/share/vlang/"
  cp -a "${srcdir}"/tutorials "$pkgdir/usr/share/vlang/"
  cp -a "${srcdir}"/doc "$pkgdir/usr/share/vlang/"
  cp -a "${srcdir}"/thirdparty "$pkgdir/usr/lib/vlang/"
  cp -a "${srcdir}"/vlib "$pkgdir/usr/lib/vlang/"
  ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}
# vim:set ts=2 sw=2 et: