# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=vultr
pkgver=1.9
pkgrel=1
pkgdesc="A CLI and API client library for Vultr.com cloud environment"
arch=(x86_64 i686)
url="https://jamesclonk.github.io/vultr/"
license=('MIT')
options=('!strip')
_arch=
md5sums=('78008350ebb492ed066d74e049509ea7')

case $CARCH in
  x86_64)
    _arch=amd64
    ;;
  i686)
    _arch=386
    ;;
  aarch64)
    _arch=arm
    ;;  
esac

source=("https://github.com/JamesClonk/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_${_arch}.tar.gz")

package() {
  cd "$srcdir/${pkgname}_linux_${_arch}"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
