# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=vultr
pkgver=1.15.0
pkgrel=1
pkgdesc="A CLI and API client library for Vultr.com cloud environment"
arch=(x86_64 i686)
url="https://jamesclonk.github.io/vultr/"
license=('MIT')
options=('!strip')
_arch=
sha256sums=('cd158f1b3286c28a5bf7f3b8acf2d4e4f89180348d37656720c677f3a15b0123')

case $CARCH in
  x86_64)
    _arch=64bit
    ;;
  i686)
    _arch=32bit
    ;;
  aarch64)
    _arch=ARM64
    ;;
esac

source=("https://github.com/JamesClonk/${pkgname}/releases/download/${pkgver}/${pkgname}_${pkgver}_Linux-${_arch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
