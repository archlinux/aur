# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=clice-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A next-generation C++ language server for modern C++, focused on high performance and deep code intelligence."
url="https://github.com/clice-io/clice"
arch=(
  'x86_64'
)
license=('MIT')
depends=()
provides=('clice')
conflicts=('clice')
options=('!strip')

source=("${url}/releases/download/v${pkgver}/clice-${pkgver}.x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('9dd181aac9c81cae76b255e953da21c9e603fc5b406447eb26c95eaf67ed969a')

package() {
  install -d "$pkgdir/opt/clice"
  cp -a "$srcdir/clice/." "$pkgdir/opt/clice/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/clice/bin/clice "$pkgdir/usr/bin/clice"
  
  install -Dm644 "$pkgdir/opt/clice/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/opt/clice/LICENSE"
}
