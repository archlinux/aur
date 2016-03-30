# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv
pkgver=1.9.0
pkgrel=1
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv-git')
makedepends=('git' 'python-setuptools')
depends=('python-tornado' 'python-decorator' 'python3-kitchen' 'ncurses' 'python' 'python-six' 'python-requests' 'python-praw')
source=(https://github.com/michael-lazar/rtv/archive/v$pkgver.tar.gz)
md5sums=('d50b386c6145ccdaf7fbfeff0d68b657')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
