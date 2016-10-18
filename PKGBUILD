# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=rtv
pkgver=1.13.0
pkgrel=0
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('MIT')
conflicts=('rtv-git')
makedepends=('git' 'python-setuptools')
depends=('python-beautifulsoup4' 'python-decorator' 'python3-kitchen' 'ncurses' 'python' 'python-six' 'python-requests' 'python-praw' 'mailcap-fix')
source=(https://github.com/michael-lazar/rtv/archive/v$pkgver.tar.gz)
md5sums=('ef3507ede32a324be0de4338d5a89c27')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
