#Maintainer: A Farzat <a@farzat.xyz>

pkgname=radicale-decsync
_pkgname=Radicale-DecSync
pkgver=2.1.0
pkgrel=1
pkgdesc="Radicale storage plugin to add synchronization using DecSync"
arch=('any')
url="https://github.com/39aldo39/Radicale-DecSync"
license=('GPL3')
depends=('python-libdecsync')
makedepends=('python-setuptools')
source=(${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('49f6279072659e391a7cce1995d3b4d9')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
