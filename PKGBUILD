# Maintainer: Walwe <aur@walwe.de>
pkgname=md2pdf-git
gitname=md2pdf
pkgver=0.0.6.r0.gd614176
pkgrel=1
pkgdesc="A Python Markdown to PDF Converter"
arch=('any')
url="https://github.com/walwe/${gitname}"
license=('MIT')
depends=('python-click' 'wkhtmltopdf' 'python-markdown2')
makedepends=('python' 'python-setuptools' 'git')
source=("git+${url}")
sha1sums=('SKIP')
provides=('md2pdf')

pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}


build() {
  cd "${srcdir}/${gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${gitname}"
  python setup.py install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
