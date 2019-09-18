# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1523_vsc1.38.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('b1a7e081faaeba724172f7cc9f698ca0b8509e8be4cb532e20c455beac6ced0b16654687cb8648439f3857c6ba0dc8a187b5ca2723edebd6da212f25be9e0f3a')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
