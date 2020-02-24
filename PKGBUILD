# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pancritic
pkgname=python-$_pipname
pkgver=0.3.1
pkgrel=1
pkgdesc='CriticMarkdup parser with optional pandoc backend'
arch=(any)
url="https://github.com/ickc/$_pipname"
license=(GPL3)
depends=('python')
makedepends=('pandoc')
optdepends=('python-markdown: Markdown backend for Markdown output'
            'python-markdown2: Markdown2 backend for Markdown output'
            'python-panflute: Panflute backend for Markdown output'
            'python-pypandoc: Pandoc backend for Markdown output')
checkdepends=('python-coverage' 'python-markdown' 'python-markdown2' 'python-panflute' 'python-pypandoc')
source=("$pkname-$pkgver.tar.gz::https://github.com/ickc/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('73b02e3839df65c56fc8c12f443a78549f4e303add38718457b1aa581294dfa0')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

check() {
    cd "$_pipname-$pkgver"
	make test
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
