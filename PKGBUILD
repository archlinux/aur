# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mikkel Oscar Lyderik Larsen <m@moscar.net>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacqueline Outka <joutka@vyvygen.org>
# Contributor: Abuzer Rafey <arafey@vyvygen.org>

pkgname="mkdocs-material"
pkgver=9.5.30
pkgrel=2
pkgdesc="Material design theme for MkDocs"
url="https://squidfunk.github.io/mkdocs-material/"
license=("MIT")
arch=("any")
provides=("mkdocs-material" "python-mkdocs-material")
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
b2sums=('291d9302e8c49724e31493176ad72f6ad7926f167ff1e761087b83158f6689cf081ab0155eeff29985ae5f4ca5bdf36e988515e128c86506fb742ff7e3105a14')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
