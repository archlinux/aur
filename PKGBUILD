# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-xcaplib
pkgname=python-xcaplib
pkgver=2.0.1
pkgrel=1
pkgdesc="XCAP (RFC4825) client library"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-xcaplib"
depends=(
  'python-eventlib'
  'python-application'
  'python-lxml'
  'python-gevent'
)
conflicts=('python3-xcaplib')
provides=('python3-xcaplib')
replaces=('python3-xcaplib')
source=("https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4dedeb7d347d5a69e090fef98d498854b84a71d471df2cf438ceee5944979d2028dd380a729b980372b69d444f5a4c3071f48f75386c028d9192e09ba20780de')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
