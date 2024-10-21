# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=1.3.0
pkgrel=1
pkgdesc="Meta-package for glue and plugin packages"
arch=('any')
url="http://glueviz.org"
license=('BSD')
depends=('python-glue-core>=1.13.0' 'python-glue-qt>=0.1.0' 'python-glue-vispy-viewers>=1.0.3')
makedepends=('python-setuptools-scm')
optdepends=('glueviz-doc: Documentation for Glueviz')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0b8ccbc4d6c331ea64b80eca66573517ad4fcfb37535fdf2ddd1ef1692f47cee')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

