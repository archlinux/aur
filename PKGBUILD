# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.11.3
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-notebook' 'python-pyaml' 'python-mock' 'python-testfixtures')
makedepends=('python-setuptools' 'python-jupyter_packaging')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c610e4c91651c25b659fe4ad394a6e067a7144e8f35b4b6b3cb9b5b37a607ada')

build() {
    cd $srcdir/jupytext-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
