# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.4.3
pkgrel=2
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=(
        'python'
        'python-sphinx'
        'python-unidecode'
        'python-black'
        'python-sphinx_rtd_theme'
        'python-sphinx-autodoc-typehints'
        )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e0c5b549d6cab3a74b6f3b1264ef06ce42824462a167403c9950bba643d97d9b')

build() {
	cd $srcdir/uqbar-$pkgver
    python setup.py build
}

package() {
	cd $srcdir/uqbar-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
