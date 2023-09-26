# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="mkdocs"
pkgver=1.5.3
pkgrel=1
pkgdesc="Project documentation with Markdown"
url="https://www.mkdocs.org"
license=("BSD")
arch=("any")
provides=("mkdocs")
conflicts=("python-mkdocs")
depends=("python-babel"
         "python-click"
         "python-dateutil"
         "python-ghp-import"
         "python-importlib-metadata"
         "python-jinja"
         "python-livereload"
         "python-markdown"
         "python-markupsafe"
         "python-mergedeep"
         "python-mdx-gh-links"
         "python-packaging"
         "python-pathspec"
         "python-pyyaml-env-tag"
         "python-yaml"
         "python-watchdog")
makedepends=("python-hatchling" "python-pathspec" "python-build" "python-installer" "python-wheel")
optdepends=("python-lunr: to prebuild search index")
options=("!strip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1542e09f0c07aca03629337a25ca198f67bb8139380ada9ab3b5adaa5205419b')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
