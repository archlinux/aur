# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=9.0.1
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
sha256sums=('3171d55e9f9d7621becaf238f696ac7d99f7e88d6b0e931cb5f6f9750dead644')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
