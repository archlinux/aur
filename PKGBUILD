# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1692_vsc1.39.2
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('474e8363859a8bcf39e5d9c975d4f2463706651d73bb0883aec317422d829f1f87f4eaa81ad949a6363566b3bff88292b5827fe167b275dc86e514d207b195c5')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
