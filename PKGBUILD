# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=CairoSVG
pkgname=python2-cairosvg
pkgver=1.0.22
pkgrel=1
pkgdesc="Convert your SVG files to PDF and PNG."
arch=('any')
url="http://cairosvg.org"
license=('GPL')
depends=('python2' 'python2-cairocffi' 'python2-cffi' 'python2-pycparser')
makedepends=('git')
optdepends=('python2-lxml')
conflicts=()
source=("https://github.com/Kozea/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2d8cdd9870050bf0a923ec4345c7e879')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
