# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-jupytext
pkgver=1.5.2
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=('jupyter-notebook' 'python-pyaml' 'python-mock' 'python-testfixtures')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d22a813ef41c82548ef68aab0d9d42c5148a635f214e6afa21530bb9c00977d5')

build() {
    cd $srcdir/jupytext-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jupytext-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
