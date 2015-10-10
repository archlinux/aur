pkgname=python-tzwhere
pkgver=1.0
pkgrel=1
pkgdesc='Library to look up timezone from lat lng offline'
arch=('any')
url='https://github.com/pegler/pytzwhere'
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pegler/pytzwhere/archive/$pkgver.tar.gz" "2to3.patch")
sha256sums=('4d56b9ca9d6e568c05bcc2201bd4c2366726348606803035fb6366757013d206'
            '8016b6e5de38369869df2c451b75417c1e1dd3bf39ab72c4b98fbd8fd9668fd1')

package() {
  cd "$srcdir/pytzwhere-$pkgver"
  patch -p1 -i $srcdir/2to3.patch
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
