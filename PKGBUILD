# Maintainer:  Daichi Shinozaki <dsdseg@gmail.com>
pkgname=vultr
pkgver=1.5
pkgrel=2
pkgdesc="A CLI and API client library"
arch=(x86_64 i686)
url="https://jamesclonk.github.io/vultr/"
license=('MIT')
options=('!strip')
_arch=
_distdir=

case $CARCH in
  x86_64) _arch=amd64 ;;
  i686) _arch=386 ;;
  aarch64) _arch=arm ;;  
esac

source=("https://github.com/JamesClonk/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_${_arch}.tar.gz")
md5sums=('efadf5c37aabaf17fbdd3329355eaa9f')

package() {
  cd "$srcdir/${pkgname}_linux_${_arch}"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
