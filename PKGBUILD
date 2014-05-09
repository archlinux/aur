# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
_pypi_name='WeasyPrint'
pkgver=0.22
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
license=('BSD')
arch=('any')
url="http://weasyprint.org/"
makedepends=('python2' 'python2-distribute')
# Damn what a dependency hell!
depends=('python2' 'gdk-pixbuf2>=2.25' 'python2-gobject' 'python2-six'
         'python2-lxml' 'python2-cairosvg>=0.5' 'python2-html5lib'
         'python2-tinycss=0.3' 'python2-cssselect>=0.6' 'python2-pyphen'
         'python2-cffi' 'python2-cairocffi' 'pango' 'ttf-font')
pkgname="python2-weasyprint"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("https://pypi.python.org/packages/source/${_pypi_name_inital}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pypi_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('87fcee411220f50b85079b9a5b29f53f')
