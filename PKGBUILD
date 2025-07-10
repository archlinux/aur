# Maintainer: dvb < echo =oQZk5ibltmcwIGQ4VnbpxGajJXY | rev | base64 -d >

pkgname=python-password-strength
_name=py-password-strength
pkgver=0.0.3
pkgrel=2
pkgdesc="Python 2.7/3.X password strength and validation"
url="https://github.com/kolypto/py-password-strength"
license=('BSD')
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/kolypto/$_name/archive/v$pkgver.tar.gz")
sha512sums=('cc6a667b3ef66f59f05744cf424340c4b46dd91f49b47bdf3fd3903aba52161f357462aa1b8e92474e0d1dedeecd5360ef990c29a70df43e89d1b402e169a537')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
