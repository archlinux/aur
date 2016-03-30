# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=barectf
pkgver=2.1.4
pkgrel=1
pkgdesc="Generator of C99 code that can write native CTF out of a YAML configuration file"
arch=('any')
url='https://github.com/efficios/barectf'
license=('MIT')
depends=('python' 'python-termcolor' 'python-yaml')
makedepends=('python-setuptools')
provides=('barectf')
conflicts=('barectf')
source=("https://github.com/efficios/barectf/archive/v$pkgver.tar.gz")
md5sums=('ce698b0849d38f548213c8ce7b960e87')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "doc/man/barectf.1" "$pkgdir/usr/share/man/man1/barectf.1"
}
