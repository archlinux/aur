# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-tatsu
pkgver=5.0.0
pkgrel=1
pkgdesc="A tool that takes grammars in a variation of EBNF as input, and outputs memoizing (Packrat) PEG parsers in Python"
arch=('any')
url="https://github.com/neogeny/TatSu"
license=('BSD')
depends=('python')
makedepends=('python-setuptools'
	     'git')
source=("git+https://github.com/neogeny/TatSu#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/TatSu"

  python setup.py install --root="$pkgdir/" --optimize=1

  rm -rf "$pkgdir"/usr/lib/python3.*/site-packages/test

  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
