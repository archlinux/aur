# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.7.0
pkgrel=1
pkgdesc="A CalDAV and CardDAV adapter for EteSync "
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs')
replaces=('python-radicale-storage-etesync')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('76ae4ae973741c26fd73e446cb327f4d9a2e59cb35c1e64b6f7e3c1d8bf7ee77c6ca527362e613c1f49fb03c4aeef9c2c1821ec45cd345e6d30c676855b254eb')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {DESCRIPTION.rst,README.md}
}

