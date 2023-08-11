# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=9.1.21
pkgrel=1
pkgdesc="Material design theme for MkDocs"
url="http://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-material")
replaces=("python-mkdocs-material")
depends=("mkdocs"
         "mkdocs-minify-plugin"
         "mkdocs-material-extensions"
         "pymdown-extensions"
         "python-colorama"
         "python-hatch-nodejs-version"
         "python-hatch-requirements-txt"
         "python-pygments"
         "python-regex"
         "python-requests")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
sha256sums=('d1dc4c58c415703004e3f90de2d8b854e6251c59db5f7d3932a94d557a2a5875')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
