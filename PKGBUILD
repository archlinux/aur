# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="python-mkdocs-material"
pkgver=7.1.1
pkgrel=1
pkgdesc="Material design theme for MkDocs"
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
provides=("mkdocs-material")
depends=("mkdocs" "pymdown-extensions" "python-pygments" "python-mkdocs-minify-plugin" "python-mkdocs-material-extensions")
makedepends=("python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=("44e95dc6cfef2347ea6cc67e9950cac599b713d78bb49f02835479bf19616cd5")
options=("!strip")

build(){
 cd "mkdocs-material-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs-material-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
