# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.13.1.2
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-nbformat' 'python-pyaml' 'python-toml' 'python-markdown-it-py' 'python-mdit_py_plugins')
makedepends=('jupyterlab' 'python-jupyter_packaging' 'python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e4901d164fc55b6a033d8ecb97d038323b8fe07535d8d919d73fd8cd6dc1cac0')

build() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
