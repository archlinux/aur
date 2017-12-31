# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv
pkgver=1.21.0
pkgrel=1
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv-git')
makedepends=('python-setuptools')
depends=('python-beautifulsoup4' 'python-decorator' 'python3-kitchen' 'ncurses' 'python' 'python-six' 'python-requests')
source=(https://github.com/michael-lazar/rtv/archive/v$pkgver.tar.gz)
md5sums=('d46754d6bf84ad2bd435f8cdfa0e7b5e')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
