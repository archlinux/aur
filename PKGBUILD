# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1494_vsc1.38.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('92faf52f4f0ef7d203e2137463e4e8a07c69804056120117e7e365f421cb1fb1b280bdb6fe6f7c4aba3e225d93fc20ba2dde0451fe85aff49719447757d7cf80')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
