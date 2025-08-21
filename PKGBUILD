# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=django-voting
pkgver=1.1.0
pkgrel=1
pkgdesc='A generic voting application for Django projects'
arch=('any')
url="https://github.com/jezdez/django-voting/"
license=('MIT')
depends=('python-django' 'python' 'python-setuptools')
makedepends=('python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "LICENSE.rst")
md5sums=('7654e30707801f52c197f1996f986254'
         '3db715d765eaf6a426031848215cb2f3')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
