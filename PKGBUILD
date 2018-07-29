# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.2.15
pkgrel=1
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=(
        'python'
        'python-sphinx'
        'python-unidecode'
        'python-sphinx_rtd_theme'
        'python-sphinx-autodoc-typehints'
        )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("292a8f10f5f7dbc33eb94b242640582dee069b8c8a19fcf70a728a8945161f90")

build() {
	cd $srcdir/uqbar-$pkgver
    python setup.py build
}

package() {
	cd $srcdir/uqbar-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
