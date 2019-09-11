# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='opendrop'
pkgver='0.10.2'
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
sha256sums=('02768ba9f3daf72a81273545215b1997e9e6975af985a3b1a67e223b2c0bd61f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="${pkgdir}"
}
