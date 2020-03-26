# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.0.1
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://github.com/frnmst/md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=1.1.0'
         'python-setuptools')
options=(!emptydirs)
source=("${pkgname}.tar.gz::https://github.com/frnmst/md-toc/archive/${pkgver}.tar.gz")
sha256sums=('5807ddfffe054e70d65b4abc7128923f67d84baa690d9c33027be03885d082ae')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

