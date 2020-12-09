# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-md_toc
pkgver=7.0.4
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
sha512sums=('SKIP' 'b85fcb9a7224db3e9ce1fc99084cfff59b3412f88066ec031b4d4d3e948764d0a985dc67e5329e4e2db63536794451505bc7fbb98ec0f7791d12e489c8077ed7')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
