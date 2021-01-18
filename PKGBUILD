# Maintainer: Ian Young <ian at iangreenleaf dot com>

pkgname=python-rollbar
_name=rollbar
pkgver=0.15.0
pkgrel=2
pkgdesc="Easy and powerful exception tracking with rollbar"
arch=(any)
url="https://rollbar.com/docs/notifier/pyrollbar/"
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools' 'git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("75add43e634f3f75e069e1edd2b793b8d1e8800f16419a1d83065b49dd5d1372")

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

