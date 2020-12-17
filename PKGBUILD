# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.0.5
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://github.com/frnmst/md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=1.2.1'
         'python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' '8cad9a9f1677bb669391ebf0bd094a48dbd0064ae872c8a4347ae7dbd6963cf53e340e88ee5c52c3534a1877118c33dd930bce71b4cef788880432bb3ae05f24')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
