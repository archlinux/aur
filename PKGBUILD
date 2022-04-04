# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=xonsh-git
_gitname=xonsh
pkgver=0.11.0.r121.gb1fe9e49
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="https://github.com/xonsh/xonsh"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
makedepends=('git' 'python-setuptools')
conflicts=('xonsh')
source=("git+https://github.com/scopatz/xonsh.git")
install=xonsh.install
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
  install -D -m644 license "$pkgdir/usr/share/licenses/$_gitname/license"
}

