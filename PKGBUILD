# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1472_vsc1.38.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('c0c9fd2d3da9fbce03a8bb1fd51ae249142e21dd7d76161cba94a70f50f5f43640b402d4f56f73b3e8732e81d5a893b89ed42320e80637a6488b1b9ed1f484f4')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
