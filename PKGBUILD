# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=python-md_toc
pkgver=2.0.1
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://github.com/frnmst/md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils'
         'python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/md-toc/archive/${pkgver}.tar.gz")
sha256sums=('89dfefe0e9e7d91821a52ec14fae5a7a5e7a0e9e151b7458f5526c25714345c7')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


