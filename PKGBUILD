# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1485_vsc1.38.1
pkgrel=1
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('8ce1f347b650e457d816d78de8af89b46bfa26faff23b89f2296dea0f75ca347adc0f4a98bb62ab749440571c338fd5a6a0a902dc4d890bad2e76c47c97c645d')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
