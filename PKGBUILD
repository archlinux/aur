# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="python-mkdocs-material"
pkgver=7.1.8
pkgrel=1
pkgdesc="Material design theme for MkDocs"
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
provides=("mkdocs-material")
depends=("mkdocs" "pymdown-extensions" "python-pygments" "python-mkdocs-minify-plugin" "python-mkdocs-material-extensions")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=("267c7e70393dff41f830aa432b64b347a2d787d06c9ca5e1c01d1a69d7135a73")
options=("!strip")

build(){
 cd "mkdocs-material-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs-material-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
