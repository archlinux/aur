# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.3.2
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
sha256sums=('5598e79d32bc284405df1fd3b3fe976cdbd108d200cb0223450b614e25a51b0e')

build() {
	cd $srcdir/uqbar-$pkgver
    python setup.py build
}

package() {
	cd $srcdir/uqbar-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
