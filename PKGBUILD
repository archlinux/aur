# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname='python2-weasyprint'
_pkgname='WeasyPrint'
pkgver=0.42.2
_pkgver=v0.42.2
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
license=('BSD')
arch=('any')
url="http://weasyprint.org/"
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-six' 'python2-pdfrw' 'python2-cairosvg' 'python2-html5lib' 'python2-tinycss2' 
'python2-cssselect2' 'python2-pyphen' 'python2-cffi' 'python2-cairocffi' 'python2-pycparser' 'python2-webencodings' 
'gdk-pixbuf2' 'pango' 'ttf-font')
source=("https://github.com/Kozea/${_pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('367bc6f5ce2c36c308a526ddb2d22a9b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}