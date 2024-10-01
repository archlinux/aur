pkgname=python-chibi-dl-tmo
_pyname=chibi_dl_tmo
pkgver=1.1.0
pkgrel=2
pkgdesc="command script for download mangas from lectortmo.com or visortmo.com"
arch=('any')
url="https://pypi.org/project/chibi-dl-tmo/"
license=('WTFPL')
groups=()
depends=("python-chibi-dl" "python-undetected-chromedriver")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('43efd0c306dfb3e14122a219397df18afb68f777ccd76896dc55b14d5823d4c3')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
