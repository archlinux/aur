# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv
pkgver=1.24.0
pkgrel=2
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv-git')
makedepends=('python-setuptools')
depends=('python-beautifulsoup4' 'python-decorator' 'python-kitchen' 'ncurses' 'python' 'python-six' 'python-requests')
source=(https://github.com/michael-lazar/rtv/archive/v$pkgver.tar.gz)
md5sums=('59bad003b7734192a49de0d9a39eeeb9')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
