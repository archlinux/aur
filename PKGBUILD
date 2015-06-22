# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
pkgver=0.5.2
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
md5sums=('69e4cbddf631f57727e8f493122efa89')

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

