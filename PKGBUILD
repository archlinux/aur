# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
pkgver=0.7.5
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('MIT')
depends=('python-click' 'python-setuptools' 'python-lxml'
         'python-requests-toolbelt' 'python-atomicwrites'
         'python-click-threading' 'python-click-log')
optdepends=('python-requests-oauthlib: Remotestorage support')
checkdepends=('python-pytest' 'python-wsgi-intercept'
              'radicale' 'python-werkzeug' 'python-pytest-xprocess'
              'python-pytest-localserver')
source=("https://pypi.python.org/packages/source/v/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6e17fdc89ff73290a2cdb5da90dd8112')

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

