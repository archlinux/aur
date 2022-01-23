# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=8.1.8
pkgrel=1
pkgdesc="Material design theme for MkDocs"
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-material")
replaces=("python-mkdocs-material")
depends=("mkdocs" "pymdown-extensions" "python-pygments" "mkdocs-minify-plugin" "mkdocs-material-extensions")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('fd7a5f886d10ee6ebf09e1c720e57f87649fbcec2d19bdff2cc9ea65252af1cc')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
