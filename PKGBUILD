pkgname=python-chibi-wpa-supplicant
_pyname=chibi_wpa_supplicant
pkgver=1.0.0
pkgrel=2
pkgdesc="package for handling config file of wpa supplicant"
arch=('any')
url="https://pypi.org/project/chibi_wpa_supplicant/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('1fcd441e24021268caaef2526b76552cc35013bb2e012b4ef236f93d2bfa5dab')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
