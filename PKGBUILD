# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server
pkgver=1.1119_vsc1.33.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x64
source=(https://github.com/codercom/code-server/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=(SKIP)
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
