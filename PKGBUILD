# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-cli
pkgver=${GITHUB_REF_NAME#v}

pkgver=2.1.5 

pkgrel=1
pkgdesc="Tarayıcı yok, reklam yok, dikkat dağıtıcı unsur yok. Sadece siz ve eşsiz bir anime izleme deneyimi."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('CC-BY-NC-ND-4.0')
depends=('python' 'python-typer' 'python-rich' 'python-questionary' 'python-requests' 'python-packaging' 'python-pycryptodome' 'python-curl-cffi' 'python-appdirs' 'python-prompt_toolkit')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
