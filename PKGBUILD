# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=9.4.9
pkgrel=1
pkgdesc="Material design theme for MkDocs"
url="https://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
provides=("mkdocs-material" "python-mkdocs-material" "mkdocs-material-extensions")
conflicts=("python-mkdocs-material")
replaces=("python-mkdocs-material")
depends=("mkdocs"
         "mkdocs-minify-plugin"
         "mkdocs-material-extensions"
         "pngquant"
         "pymdown-extensions"
         "python-cairosvg"
         "python-colorama"
         "python-hatch-nodejs-version"
         "python-hatch-requirements-txt"
         "python-paginate"
         "python-pygments"
         "python-regex"
         "python-requests"
         "python-xcffib")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
optdepends=("python-jieba: allow search for chinese language")
source=("$pkgname-$pkgver.tar.gz::https://github.com/squidfunk/mkdocs-material/archive/$pkgver.tar.gz")
b2sums=('69411102e874017f9a74991cda8552d9ea2422ba5717bfe31e89f99f1e042711ea2c12cf4eb1bcd1b897d260c262869c9c230c5c4ec8c9a110be5583546dd882')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
