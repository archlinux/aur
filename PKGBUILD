# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-cli
_name=${pkgname}
pkgver=2.1.3
pkgrel=1
pkgdesc="Tarayıcı yok, reklam yok, dikkat dağıtıcı unsur yok. Sadece siz ve eşsiz bir anime izleme deneyimi."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('CC-BY-NC-ND-4.0')
depends=('python' 'python-typer' 'python-rich' 'python-questionary' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/ewgsta/weeb-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca80a55eb71130289043c4a4e848d5c903b70b2715be7a220d4f248c4f1947af')

build() {
    cd "${_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
