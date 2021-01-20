# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.1.0
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://github.com/frnmst/md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=1.2.2'
         'python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' '35d8d47d652faad7cc52cd32c54c3816ecb2aff4f8377c2e75f4c7d134fd117cce4a0df8fdadced380864a370af4b480d5c21a84d8c39560f1ba0e7d0f9fcb22')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
