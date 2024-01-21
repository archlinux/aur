# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-msal-extensions'
_name='microsoft-authentication-extensions-for-python'
pkgver='1.1.0'
pkgrel=1
pkgdesc="Microsoft Authentication Extensions for Python"
url="https://github.com/AzureAD/$_name"
depends=('python-msal' 'python-portalocker')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e49fcc7f16228f9645aab2b1033479b6ee8b93655c70326392d19c4affb99a7b')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
