# Maintainer: Christopher Kobayashi <software+aur@disavowed.jp>

pkgname=vultr
pkgver=2.0.3
pkgrel=1
pkgdesc="A CLI and API client library for Vultr.com cloud environment"
arch=('x86_64' 'i686' 'aarch64')
url="https://jamesclonk.github.io/vultr/"
license=('MIT')
options=('!strip')
_arch=
sha512sums=('be9678ade50900b3bfc39b392a64019f0cdceb77f08ae62e4599b558e585a6b1eb1c18d9d827d022b3d39d780721e10fb283a084e82d4ba40f06cc99d492e097')

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

source=("https://github.com/JamesClonk/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_Linux-${_arch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
