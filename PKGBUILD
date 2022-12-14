# Maintainer: MoetaYuko <loli at yuko dot moe>

pkgname=python-jupytext
pkgver=1.14.4
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-nbformat' 'python-pyaml' 'python-toml' 'python-markdown-it-py' 'python-mdit_py_plugins')
makedepends=('jupyterlab' 'python-jupyter_packaging' 'python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5a1844d4b5c5f0f5a6b50309a246e4a9b7b6bf4ef1d3891a4a30c20f0b89a6b')

build() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
