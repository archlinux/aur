# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='opendrop'
pkgver='0.10.3'
pkgrel='1'
pkgdesc='An open Apple AirDrop implementation'
arch=('any')
url="https://github.com/seemoo-lab/${pkgname}"
license=('GPL')
depends=('python-requests' 'python-fleep' 'python-ifaddr'
	 'python-pillow' 'python-requests-toolbelt'
	 'python-ctypescrypto' 'python-libarchive-c'
	 'python-netifaces' 'owlink')
makedepends=('python' 'python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d9de0d24977569410e4d4304842589ba9216edd1ea8ff4f03c9edcd7711e1006')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"
}
