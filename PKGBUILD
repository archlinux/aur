# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=lsvine
pkgver=0.1.2
pkgrel=1
pkgdesc="List contents of directories in a vine-like format"
url=https://github.com/autofitcloud/lsvine
license=('APACHE')
arch=('any')
depends=('python-click' 'python-pandas' 'python-tabulate' 'python-termcolor')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a7b61292d25c6730308594a5177da8b97793f6e3d433802bb102bd53ee9db962')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
