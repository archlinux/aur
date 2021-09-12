# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.12.0
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-notebook' 'python-pyaml' 'python-mock' 'python-testfixtures')
makedepends=('python-setuptools' 'python-jupyter_packaging')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('096636a651b8414b3a27c0f0da6442e0fd72cf155797911019565d4aebe0d169')

build() {
    cd $srcdir/jupytext-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
