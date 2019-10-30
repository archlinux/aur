# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver=2.1665_vsc1.39.2
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x86_64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('a23e7fd98ea4fb7d6be23333ddc7e4529d346d48e595d6033811bbb982efad2f94aa759ff7dc8708932e2dd7bc8ef353dc06a6b223caa0a40c0f22d800dda404')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
