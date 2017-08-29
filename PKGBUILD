# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.5.12
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
sha256sums=('5726d67bb40ec0d22ad37630127a54b866c75d537618dcf77101f1c19d54a7e5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
