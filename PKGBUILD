# Maintainer: Colin Adler <cadler@coder.com>

pkgname=code-server
pkgver=1.1156_vsc1.33.1
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc net-tools)
_ghtag=${pkgver//_/-}
_dirname=code-server${_ghtag}-linux-x64
source=(${url}/releases/download/${_ghtag}/${_dirname}.tar.gz)
sha512sums=('60e9f6cecf7681899a71cda7fcb7acb3d8e0b50ee819f3971d9f207a816e4273162d1374e143dd61e9029c3c7add73d33db98df7bab882758d1968188fd83dee')
options=('!strip')

package() {
  cd "$srcdir"/${_dirname}

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
