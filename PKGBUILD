# Maintainer: BrainDamage
pkgname="python-wfdb"
_dirname='wfdb-python'
pkgver=3.4.1
pkgrel=1
pkgdesc="A library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-nose" "python-pandas" "python-requests" "python-scikit-learn" "python-certifi" "python-chardet" "python-cycler" "python-idna" "python-joblib" "python-pyparsing" "python-dateutil" "python-pytz" "python-requests" "python-urllib3" "python-threadpoolctl")
sha256sums=('1e90b7afc31e5f42db8c482cc4002e16188f1291c504575336fc1a2c73cc9025')
source=("https://github.com/MIT-LCP/${_dirname}/archive/v${pkgver}.tar.gz")


build() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
}

