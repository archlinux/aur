pkgname=python-undetected
_pyname=undetected
pkgver=0.0.13
pkgrel=1
pkgdesc="Selenium.webdriver.Chrome replacement with compatibility for Brave, and other Chromium based browsers. Not triggered by CloudFlare/Imperva/hCaptcha and such."
arch=('any')
url="https://pypi.org/project/undetected/"
license=('GPL-3.0')
groups=()
depends=( 'python' 'python-requests' "python-websockets" 'python-selenium' 'python-packaging' )
makedepends=( 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core' )
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('702091ae02719b6e07b65a26a7f4c89c91d995fa0dfe9f7730c4ca7035f9b6df')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd $_pyname-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
