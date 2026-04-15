# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-cli
pkgver=2.14.2
pkgrel=1
pkgdesc="No browser, no ads, no distractions. Just you and an unparalleled anime viewing experience."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('GPL-3.0-only')
depends=('python' 'python-typer' 'python-rich' 'python-questionary' 'python-requests' 'python-packaging' 'python-pycryptodome' 'python-curl-cffi' 'python-appdirs' 'python-prompt_toolkit' 'python-beautifulsoup4' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
