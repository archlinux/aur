# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.4.2
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-notebook' 'python-pyaml' 'python-mock' 'python-testfixtures')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f802d354bbb39ea917cf99847bb9e2d4a8c0e3561826401894715d9833f85bad')

build() {
    cd $srcdir/jupytext-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
