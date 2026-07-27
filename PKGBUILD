pkgname=python-chibi-site
_pyname=chibi_site
pkgver=0.2.0
pkgrel=1
pkgdesc="Library for creating website scrapers"
arch=('any')
url="https://pypi.org/project/chibi-site/"
license=('WTFPL')
groups=()
depends=( 'python-chibi' "python-chibi-requests" 'python-selenium' )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('b30e479b1e3df343e4fca854bccb385a742fb429537387a8bcc69a5e54a88838')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
