# Maintainer: Colin Adler <cadler@coder.com>

pkgname=code-server
pkgver=1.1119_vsc1.33.1
pkgrel=1
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('ff357061c122db327343135f157b86b1fd0e3afcaa568218dc8970f3e546ccf6e2a42829536ae207958831469fde28a0e038efb28619bb4dc8081af575c0d550')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
