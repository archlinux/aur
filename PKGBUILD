# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=idiotic
pkgname=idiotic
pkgver=0.1.6
pkgrel=2
pkgdesc='Distributed home automation controller'
arch=('any')
url="https://github.com/idiotic/$_name"
license=('MIT')
depends=('python>=3.4' 'python-aiohttp>=0.21.2' 'python-docopt>=0.6.2' 'python-pylint>=1.5.4' 'python-schedule>=0.3.2' 'python-werkzeug>=0.11.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")	
backup=('etc/idiotic/conf.json')
md5sums=('89c7b56583a001a800bb288d543754c7')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
