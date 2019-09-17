# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1495_vsc1.38.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('bdf32051a65b400c4f520c3f7df66068580c326bfe21af2228381bccfc2e0f8910571587ba78c07fde873011a14cd30526d181b6eb0c1612fb17acc0b692068a')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
