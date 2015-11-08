# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.2.3
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip"
	"0001-installation-of-jupyter-hook-to-given-destination.patch")
install=xonsh.install
sha256sums=('9fa73d1cf28ab851bde654978bdc73a366e7c28cfe7fcdb7cb84eeb03c70c411'
	'0cacd63515b512e390cabd46b076c3f0461e1cd3a7218f8830bd1b0ccd860498')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  patch setup.py "$srcdir/0001-installation-of-jupyter-hook-to-given-destination.patch"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
