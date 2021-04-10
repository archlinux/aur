# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.2.0
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=1.2.3'
         'python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' "8674e1235c3af2b4c150e64b3caeac0e92134429df8967117a18fbd6d9a60a634acfb1165b45360677fe75481f3ad6abf7868961689f5ebc888b89ed5cc7583b")

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
