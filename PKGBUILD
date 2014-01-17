# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
_pypi_name='WeasyPrint'
pkgver=0.15
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
license=('BSD')
arch=('any')
url="http://weasyprint.org/"
makedepends=('python2' 'python2-distribute')
depends=('python2' 'pango>=1.29.3' 'gdk-pixbuf2>=2.25' 'python2-gobject'
         'python2-cairo' 'python2-lxml' 'python2-cairosvg>=0.4.1'
         'python2-tinycss=0.3' 'python2-cssselect>=0.6')

pkgname="python2-weasyprint"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("http://pypi.python.org/packages/source/${_pypi_name_inital}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('56b87ea799bfd4f422892c55b4f337aa')


package() {
  cd "$srcdir/WeasyPrint-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/bin"  # Avoid a conflict: only keep the Py3 executable.
}
