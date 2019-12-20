# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='opendrop'
pkgver='0.11.0'
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
sha256sums=('014b62768d3e0b65051ddf45bc0394b664b0acefae1032a7719ac09716c79e68')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"
}
