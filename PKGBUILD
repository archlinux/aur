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
sha256sums=('e89669e726f486a6ffea0b5ea47095d6936a62cc2e7c8b05d11b3c9cbe6930ec')

build() {
    cd "${_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
