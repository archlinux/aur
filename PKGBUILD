# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-with-pdf"
pkgver=0.9.3
pkgrel=2
pkgdesc="Plugin to generate a single PDF file from a MkDocs repository"
url="https://github.com/orzih/mkdocs-with-pdf"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-with-pdf-git")
replaces=("python-mkdocs-with-pdf-git")
depends=("mkdocs" "python-beautifulsoup4" "python-libsass" "python-weasyprint")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5977570d90296f67a1e622bbf6b23d931ff31765e035bf015de363cf808e467c')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
