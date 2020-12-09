#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-sdf
_pipname=SDF
pkgver=0.3.5
pkgrel=1
pkgdesc="Python library to work with the Scientific Data Format"
url="https://github.com/ScientificDataFormat/SDF-Python"
arch=('x86_64')
license=('custom:BSD 3-clause')
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-h5py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/7e/0f/35fe015db93179c905795b84cc03fc79b5b40d0daf530e1e075b0f78aea2/${_pipname}-${pkgver}.tar.gz"
"LICENSE")
sha256sums=('7be0abd14f0cb742745b383436f7b26d883396610da045ba485f24cc5bbfd22f'
'SKIP')

build() {
  cd ${srcdir}/${_pipname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pipname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  cd ..
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}