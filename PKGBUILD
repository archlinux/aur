# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=4.0.0
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
sha256sums=('4b3443b3fa23f1fa3c3f0fff5f38b88c114aa9901e830f97959ac19138c3e9b9')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

