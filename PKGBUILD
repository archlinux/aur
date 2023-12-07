# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=9.5.0
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
b2sums=('3c9f7b7cc656cd25953d021b2914884f2ede145b8c4cece0ec55013ee955a25d8ad4021de0abf3fd340b0bbc996ca42fe1391752febe7dad464da232c7d1892b')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
