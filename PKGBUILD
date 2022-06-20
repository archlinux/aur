# Maintainer: Franco Masotti <franco dot masotti at tutanota dot com>
# Contributor: Franco Masotti <franco dot masotti at tutanota dot com>
pkgname=python-md_toc
pkgver=8.1.4
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=2.2.0'
         'python-setuptools'
         'python-pyfakefs')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' 'f85eeda216e190c036781e52c91fadf1a38e70223c2368f62248622a9a419edf5041e66b7505ecebbf9863a570551285661defac0a8603beb8ee67377d37618e')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
