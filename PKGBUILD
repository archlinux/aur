# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1650_vsc1.39.2
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('d203563de97ba223c22f97040ee3306e90bb90f22b02d9031b572d42617506cc203d0fedbbdf7c637cbe5c6fd67cebe7edb1d21f45d32db43368948f742bb708')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
