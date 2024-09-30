pkgname=python-chibi-dl-tmo
_pyname=chibi_dl_tmo
pkgver=1.1.0
pkgrel=1
pkgdesc="command script for download mangas from lectortmo.com or visortmo.com"
arch=('any')
url="https://pypi.org/project/chibi-dl-tmo/"
license=('WTFPL')
groups=()
depends=("python-chibi-dl" "python-undetected-chromedriver")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('40582b63cae040a72c45b9e35f608936414c10fc7a2cd61309f06cc2f708fd78')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
