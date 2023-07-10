# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=1.2.0
pkgrel=1
pkgdesc="Meta-package for glue and plugin packages"
arch=('any')
url="http://glueviz.org"
license=('BSD')
depends=('python-glue-core>=1.2.0' 'python-glue-vispy-viewers>=1.0.3')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('795ddeef13b8f0392d9de5a318ee1a5b03ddfa6eada51986465e2a4b1549e372')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

