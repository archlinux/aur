pkgname=python-chibi-dl-tmo
_pyname=chibi_dl_tmo
pkgver=0.1.3
pkgrel=1
pkgdesc="command script for download mangas from lectortmo.com or visortmo.com"
arch=('any')
url="https://pypi.org/project/chibi-dl-tmo/"
license=('WTFPL')
groups=()
depends=("python-chibi-dl" "python-undetected-chromedriver")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('40c0a5bbe320f9d6bfd6854038b44bfec7733e67e6b653c6c295fb65de64ad00')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
