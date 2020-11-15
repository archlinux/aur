# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.7.0
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-notebook' 'python-pyaml' 'python-mock' 'python-testfixtures')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fba1e27b963a0c9120b71bd94f7a9df8e81297d25f0ff1a73819c78f58b64683')

build() {
    cd $srcdir/jupytext-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
