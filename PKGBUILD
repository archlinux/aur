# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.0.3
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://github.com/frnmst/md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=1.2.0'
         'python-setuptools')
options=(!emptydirs)
source=("https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz.sig" "https://frnmst.gitlab.io/software/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' '3de39887c282d5808288469c97efc537a8dbd1412b54abe9130f3c3e41c2d08d05aabffaa2b3e5dbea75e18c47c0dc0cf82c15ebebe3b7b820d7176e14eced69')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

