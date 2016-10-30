# Maintainer: quomoow <quomoow@gmail.com>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='python2-weasyprint'
_pkgname='WeasyPrint'
_pypi_name_initial=$(echo ${_pkgname}|cut -c1)
pkgver=0.31
_pkgver=v0.31
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
license=('BSD')
arch=('any')
url="http://weasyprint.org/"
makedepends=('python2' 'python2-distribute')
depends=('python2' 'gdk-pixbuf2' 'python2-gobject' 'python2-six'
         'python2-lxml' 'python2-cairosvg' 'python2-html5lib'
         'python2-tinycss' 'python2-cssselect' 'python2-pyphen'
         'python2-cffi' 'python2-cairocffi' 'pango' 'ttf-font')
source=("https://github.com/Kozea/${_pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('6fad162be01d008ed408c47e6ea927ff')

build() {

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
