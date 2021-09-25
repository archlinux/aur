# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.13.0
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-nbformat' 'python-pyaml' 'python-toml' 'python-markdown-it-py' 'python-mdit_py_plugins')
makedepends=('jupyterlab' 'python-jupyter_packaging' 'python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f79a0c9f488d7344aa38070a63782612500be28e91806092a81649a4aa710af')

build() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
