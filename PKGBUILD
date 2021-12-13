# Maintainer: BrainDamage
pkgname="python-wfdb"
_dirname='wfdb-python'
pkgver=3.3.0
pkgrel=2
pkgdesc="A library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-nose" "python-pandas" "python-requests" "python-scikit-learn" "python-certifi" "python-chardet" "python-cycler" "python-idna" "python-joblib" "python-pyparsing" "python-dateutil" "python-pytz" "python-requests" "python-urllib3" "python-threadpoolctl")
sha256sums=('0fe5df76ccb718536a4ea9cce4ca37aedda990a9d474f50facbea511edaee75d')
source=("https://github.com/MIT-LCP/${_dirname}/archive/v${pkgver}.tar.gz")


build() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
}

