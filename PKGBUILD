# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-with-pdf"
pkgver=0.9.2
pkgrel=1
pkgdesc="Plugin to generate a single PDF file from a MkDocs repository"
url="https://github.com/orzih/mkdocs-with-pdf"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-with-pdf-git")
replaces=("python-mkdocs-with-pdf-git")
depends=("mkdocs" "python-libsass" "python-weasyprint")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("5596552fbf13887aeb3ec4c53822867692a742979de85ba1f6770bfbf2c73d4a")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
