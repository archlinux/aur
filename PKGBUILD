# Maintainer: András Wacha < awacha at gmail dot com >

_pkgname=sphinxcontrib-pdfembed
pkgname=python-${_pkgname}-git
pkgver=r17.d75fb37
pkgrel=2
pkgdesc='Sphinx extension to embed a pdf file in a webpage'
url="https://github.com/SuperKogito/sphinxcontrib-pdfembed"
arch=('any')
license=('BSD')
makedepends=('git' 'python-setuptools')
depends=('python-sphinx')
provides=("python-sphinxcontrib-pdfembed")
conflicts=("python-sphinxcontrib-pdfembed")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
