# Maintainer: MoetaYuko <loli at yuko dot moe>

pkgname=python-jupytext
pkgver=1.14.1
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-nbformat' 'python-pyaml' 'python-toml' 'python-markdown-it-py' 'python-mdit_py_plugins')
makedepends=('jupyterlab' 'python-jupyter_packaging' 'python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('56bdcaefb02ad25230317ddfb7ed4dc57f9f58eebbca7192aa0dc81c11c89671')

build() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    BUILD_JUPYTERLAB_EXTENSION=1 python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
