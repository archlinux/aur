# Maintainer: Franco Masotti <franco dot masotti at tutanota dot com>
# Contributor: Franco Masotti <franco dot masotti at tutanota dot com>
pkgname=python-md_toc
pkgver=8.1.7
pkgrel=1
pkgdesc="Automatically generate a compliant table of contents for a markdown file to improve document readability"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL3')
depends=('python'
         'python-fpyutils=3.0.0'
         'python-setuptools'
         'python-pyfakefs')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/md-toc-${pkgver}/md-toc-${pkgver}.tar.gz")
sha512sums=('SKIP' '4dfad99badd0c5ef915cc0a831327e2dace9918f270dd7f80ff66d4a2b31465347e0b263af673c53392e4b633f7da3047753e66ed557337465c7c5918bab4489')

check() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/md-toc-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
