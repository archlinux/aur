# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1638_vsc1.39.2
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('b6b7be5f5bece35badb8c002355ea3c83fcd2a69fc3c145a91da1cfeb3eff8320958355d0a0dc5e069fb26635c5668d451d681b48e908ab7eedf3dbdb25c5e58')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
