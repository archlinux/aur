# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=3.1.0
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
sha256sums=('dc597994ab21ca843ffdde4f68c145cd86d7163cd86baac0159077342aa6425e')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

