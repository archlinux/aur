# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv
pkgver=1.5
pkgrel=2
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv-git')
makedepends=('git')
depends=('python-tornado' 'python-decorator' 'python3-kitchen' 'ncurses' 'python' 'python-six' 'python-requests' 'python-praw-git' 'python-setuptools')
source=(https://github.com/michael-lazar/rtv/archive/v$pkgver.tar.gz)
md5sums=('9a343ed105b360ebd890942ae45926f7')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
