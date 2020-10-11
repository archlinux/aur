# Maintainer: Frank Seifferth <frankseifferth@posteo.net>

pkgname=pandoc-static-katex-git
provides=('pandoc-static-katex')
pkgver=latest
pkgrel=1
pkgdesc="A simple pandoc filter that uses KaTeX to render math equations at build time."
license=('MIT')
arch=('any')
url="https://github.com/Zaharid/pandoc_static_katex"
depends=('python-pandocfilters' 'python>=3.7' 'katex')
makedepends=('git')
source=("$pkgname::git+https://github.com/Zaharid/pandoc_static_katex")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -D -m 755 \
        "$srcdir/$pkgname/pandoc_static_katex.py" \
        "$pkgdir/usr/bin/pandoc-static-katex"
}
