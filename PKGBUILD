# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=clice-bin
pkgver=0.1.2026102007
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

sha256sums=('6b923fc59298e354d133742887fb3a09ad32624bb056732b31334a3534b111bf')

package() {
  install -d "$pkgdir/opt/clice"
  cp -a "$srcdir/clice/." "$pkgdir/opt/clice/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/clice/bin/clice "$pkgdir/usr/bin/clice"
  
  install -Dm644 "$pkgdir/opt/clice/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/opt/clice/LICENSE"
}
