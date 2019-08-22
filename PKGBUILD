# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='opendrop'
pkgver='0.10.1'
pkgrel='1'
pkgdesc='An open Apple AirDrop implementation'
arch=('any')
url="https://github.com/seemoo-lab/${pkgname}"
license=('GPL')
depends=('python-requests' 'python-fleep' 'python-ifaddr'
	 'python-pillow' 'python-requests-toolbelt'
	 'python-ctypescrypto' 'python-libarchive-c')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/o/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7738b1bc381f7026a4db06d5d15e0faddd706d556c22f299cd5b9d9dbd294553')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"
}
