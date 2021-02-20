# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-with-pdf-git"
pkgver=v0.8.2.r5.g75548c2
pkgrel=1
pkgdesc="Plugin to generate a single PDF file from a MkDocs repository"
url="https://github.com/orzih/mkdocs-with-pdf"
license=("MIT")
arch=("any")
provides=("python-mkdocs-with-pdf")
depends=("mkdocs" "python-libsass" "python-weasyprint")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-with-pdf"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-with-pdf"
 python setup.py build
}

package(){
 cd "mkdocs-with-pdf"
 python setup.py install --root="$pkgdir" --optimize=1
}
