# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1478_vsc1.38.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('aee38da43c52f09597a34245d52c6f86d64d58424e38c7c03bd570700c8c36fe87097be4e8651ae9e8176eb31837adaf9c5336f784c3899cecb216ceef5d06a1')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
