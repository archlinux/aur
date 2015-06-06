# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
pkgver=0.5.1
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('MIT')
depends=('python-click' 'python-setuptools' 'python-lxml'
         'python-requests-toolbelt' 'python-atomicwrites')
checkdepends=('python-pytest' 'python-wsgi-intercept'
              'radicale' 'python-werkzeug-git' 'python-pytest-xprocess'
              'python-pytest-localserver')
source=("https://github.com/untitaker/${pkgname}/archive/${pkgver}.zip")
md5sums=('5e73eb6f306157c8179ef3e608037caf')

# check() {
#   cd "$srcdir/${pkgname}-$pkgver"
#   sh build.sh tests
# }

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

