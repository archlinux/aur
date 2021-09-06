# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-libversion
pkgver=1.2.3
pkgrel=1
pkgdesc="Python bindings for libversion"
url='https://pypi.org/project/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('python' 'libversion')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/py-libversion/archive/${pkgver}.tar.gz")
sha256sums=('1354134720db1a4fa5734e8681952ca2233b858128953b3458a88b0622d3dac8')
b2sums=('450851b7438ab673bab82845ce829f00fe28a787021138392dd60f649a227a9c827cd842d17e644037709e696dc0b9edd32b701264f7231e4d3f7fd21f09476d')

build() {
  cd "py-libversion-${pkgver}"

  python setup.py build
}

package() {
  cd "py-libversion-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
