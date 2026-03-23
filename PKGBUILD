# Maintainer: Hamza <everyoneexe001 at gmail dot com>
pkgname=python-2captcha
_name=2captcha-python
pkgver=2.0.5
pkgrel=1
pkgdesc="Python client for 2captcha.com API"
arch=('any')
url="https://github.com/2captcha/2captcha-python"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/0e/87/856448695f228d9608c8f1fa9a3fb2ab12d847bc4447b8fb30920324a8ac/2captcha_python-$pkgver.tar.gz")
sha256sums=('fd72de2d0780284dc4adb45740164821c32dd10bb055698a83cce02419d8454b')

build() {
    cd "2captcha_python-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "2captcha_python-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
