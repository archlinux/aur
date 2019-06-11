# Maintainer: Colin Adler <cadler@coder.com>

pkgname=code-server
pkgver=1.1140_vsc1.33.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('d93e0add97366019394ede36e53cb642b5751d0da1a4fef9d8efb25873999175e9401634d46dce86b8e381f02607a2cde91e8bf3422bd47c7d37fb9e1b7acaae')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
