# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=xonsh-git
_gitname=xonsh
pkgver=0.4.2.r24.g69243a1
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://github.com/scopatz/xonsh"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
makedepends=('python-setuptools')
conflicts=('xonsh')
source=("git://github.com/scopatz/$_gitname.git")
install=xonsh.install
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$_gitname/license"
}

