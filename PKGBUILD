# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=pyevtk
pkgname=python-${_name}
pkgver=1.1.0
pkgrel=1
pkgdesc='Export data as binary VTK files'
arch=('any')
url='https://bitbucket.org/pauloh/pyevtk'
license=('BSD')
depends=('python-numpy')
makedepends=('')
optdepends=()
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	'https://bitbucket.org/pauloh/pyevtk/raw/e253ef56687d86be5daf1d9e6ad9fcf9cffbb327/src/LICENSE')
md5sums=('2ae1a98ddbfc51a48996cb680caa2957'
         '25974a4eee315dd7dd57ce00237cd2c8')

package() {
	cd "$srcdir/$_name-$pkgver"

	install -D -m644 "${srcdir}/LICENSE" \
		             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mv README.txt README.md
	python setup.py install --optimize=1 --root=$pkgdir
}

