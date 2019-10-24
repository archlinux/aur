# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1637_vsc1.39.2
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('a5ed9d65276b8f1bb2a706ca112b29b88d49e3b8b5826bc87f1eb389ff676b071e154b11ead1eff4780be160753084f9f915c434237718c9c4ada35ca780bc3a')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
