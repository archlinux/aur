# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-zulip
pkgver=0.9.1
pkgrel=1
pkgdesc="Bindings for the Zulip message API"
arch=('any')
url="https://github.com/zulip/python-zulip-api"
license=('APACHE')
depends=('python-requests' 'python-distro' 'python-click' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/z/zulip/zulip-$pkgver.tar.gz")
sha256sums=('abeba4147625107f690bb633143fdf36cd665fe037b3871011fd4b1e3dc081e8')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
