# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
ghtag="2.1698"
vscver="vsc1.41.1"
pkgver="${ghtag}_${vscver}"
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_dirname=code-server${pkgver//_/-}-linux-x86_64
source=(${url}/releases/download/${ghtag}/${_dirname}.tar.gz)
sha512sums=('120eed5268cd344270536d54547eacbe8a86dce122d1f9caccc45d1c023a2b2efda7897984e7397eb18f1e5b0aea61aeea09f2357803ec5f68d320c6cf4f9389')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
