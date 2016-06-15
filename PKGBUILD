# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.3.4
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xon.sh/"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
makedepends=('python-setuptools')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('f8f4156c650e0cdf7624b6e5a75c0722b4b599dd2fba2ecd4e1eb6e5fb8b6597')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
