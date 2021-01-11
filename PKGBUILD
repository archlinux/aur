# Maintainer: Michael Armbruster <michael@armbrust.me>

_pkgname=mechanize
pkgname=python2-mechanize
pkgver=0.4.5
pkgrel=1
pkgdesc='Stateful programmatic web browsing in Python'
arch=('any')
url="https://github.com/python-mechanize/mechanize"
license=('BSD')
depends=('python2' 'python2-html5lib')
makedepends=('python2-setuptools')
checkdepends=('python2-zope-interface' 'python2-twisted')
optdepends=('python2-html5-parser: faster parsing of HTML')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('6355c11141f6d4b54a17fc2106944806b5db2711e60b120d15d83db438c333fd'
            'SKIP')
b2sums=('67951ad8295a32799768b3719525d45d502bc773c6f2a5e762e3dae97f309c8c265a2cb3efde95c9e8cb65e89dee6ad6ad8585685baa4e9ff1acfd146f115f6f'
        'SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

build() {
  cd "mechanize-$pkgver"

  python2 setup.py build
}

check() {
  cd "mechanize-$pkgver"

  python2 setup.py test
}

package() {
  cd "mechanize-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
