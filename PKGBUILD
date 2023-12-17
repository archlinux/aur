# Maintainer: Tony Benoy <me@tonybenoy.com>
# Contributor: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Slithery <aur at slithery dot uk>

_name=linode_api4
pkgname="python-$_name"
pkgver=5.11
pkgrel=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/$_name-python"
license=('BSD')
depends=('python-setuptools' 'python-requests')
replaces=('python-linode-api')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3db6105732d3bf1ff328796063b305d1d3977a4ff4433e024da06666243e468a')

build () {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
