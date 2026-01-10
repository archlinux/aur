# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="Tarayıcı yok, reklam yok, dikkat dağıtıcı unsur yok. Sadece siz ve eşsiz bir anime izleme deneyimi."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('CC-BY-NC-ND-4.0')
depends=('python' 'python-typer' 'python-rich' 'python-questionary' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3687f7d96331bb1ac9888257a92fcb80988f42939e18d5a0d0823dce133bfc30')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
