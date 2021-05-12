# Maintainer: SZanko, szanko at protonmail dot com

pkgbase="mailchecker"
pkgname=(
	#"go-mailchecker"
	#"nodejs-mailchecker"
	#"php-mailchecker"
	"python-mailchecker"
	#"ruby-mailchecker"
	#"rust-mailchecker"
)
_pkgname="mailchecker"
pkgver="4.0.7"
pkgrel="2"
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='https://github.com/FGRibreau/mailchecker/'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7ae8908b5bff1c2827058c9925fb4b38539d9c77bcfd902a3edfa4499574e82e')
makedepends=(
'python-distribute'
)


build() {
  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python setup.py build
}


package_python-mailchecker() {
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/python-theano/LICENSE.txt"
}
