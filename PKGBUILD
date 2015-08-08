# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Dennis Fink <dennis.fink@c3l.lu>
# Submitter: Simon Sapin <simon dot sapin at exyr dot org>
pkgname=python2-cairosvg
pkgver=1.0.9
pkgrel=1
pkgdesc="A Simple SVG Converter for Cairo"
arch=('any')
url="http://cairosvg.org/"
license=('LGPL3')
depends=('python2' 'python2-cairo')
optdepends=('python2-lxml: To use lxml to parse SVG files'
'python2-tinycss: Apply CSS not included in the style attribute of the tags'
'python2-cssselect: Apply CSS not included in the style attribute of the tags'
'python2-pillow: To handle embedded raster images other than PNG')
source=("http://pypi.python.org/packages/source/C/CairoSVG/CairoSVG-${pkgver}.tar.gz")
md5sums=('4a15e7cf8debd205f6a9cc4b17c2e411')

build() {
  cd "$srcdir/CairoSVG-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/CairoSVG-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
