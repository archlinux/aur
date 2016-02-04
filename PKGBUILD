# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=vultr
pkgver=1.6
pkgrel=1
pkgdesc="A CLI and API client library for Vultr.com cloud environment"
arch=(x86_64 i686)
url="https://jamesclonk.github.io/vultr/"
license=('MIT')
options=('!strip')
_arch=
md5sums=()

case $CARCH in
  x86_64)
    _arch=amd64
    md5sums=('32d4edf828933bc51ed2b694f302b8f3')
    ;;
  i686)
    _arch=386
    md5sums=('d24dc1ca514ead5e2cbe3b19b263a94a')
    ;;
  aarch64)
    _arch=arm
    md5sums=('e7bcef3f4c05ff9e884a6021e1280fe6')
    ;;  
esac

source=("https://github.com/JamesClonk/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_${_arch}.tar.gz")

package() {
  cd "$srcdir/${pkgname}_linux_${_arch}"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
