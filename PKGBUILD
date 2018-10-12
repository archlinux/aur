# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=importlab

pkgname=python-importlab
pkgver=0.3.1
pkgrel=1
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/89/f7/ef55882b6db6022ef476a4fbd8c843f3c25971d9d6e7766be9ae6f11146e/importlab-0.3.1.tar.gz")
sha256sums=('b5fdb0e32c43192aa13869c9b14a8141ec5f73c406581fa544e57a12cda2ae53')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
