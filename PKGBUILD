# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vlang-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software. Compiles itself in <1s with zero dependencies'
arch=('x86_64')
url="https://vlang.io"
install=vlang-bin.install
license=('MIT')
provides=('vlang')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('2656b81e8cc46ffb157c9d2dc67e5494522d33418f01dfc098757bfc64f8d085')

package() {
  install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
  install -Dm644 v/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 v/v "$pkgdir/usr/lib/vlang"
  cp -avR v/cmd "$pkgdir/usr/lib/vlang/"
  chmod -R 777 "$pkgdir/usr/lib/vlang/cmd"
  cp -avR v/examples "$pkgdir/usr/share/vlang/"
  cp -avR v/thirdparty "$pkgdir/usr/lib/vlang/"
  cp -avR v/vlib "$pkgdir/usr/lib/vlang/"
  cp v/v.mod "$pkgdir/usr/lib/vlang/"
  ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}
# vim:set ts=2 sw=2 et:
