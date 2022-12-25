# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-grid-strategy
_module=${pkgname#python-}
pkgver=0.0.1
pkgrel=1
pkgdesc='Organize matplotlib plots using different grid strategies'
arch=('any')
url="https://github.com/matplotlib/grid-strategy"
license=('Apache')
depends=(
        'python'
        'python-numpy'
        'python-matplotlib'
        )
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d8db1c12e6f33eb55ba56a5b19f4848aae862a9a343fea422a353c46ab6ccc23')

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
